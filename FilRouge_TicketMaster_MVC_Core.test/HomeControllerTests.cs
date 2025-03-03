using FilRouge_TicketMaster_MVC_Core.Controllers;
using FilRouge_TicketMaster_MVC_Core.Models;
using FilRouge_TicketMaster_MVC_Core.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;
using NUnit.Framework;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using System.Security.Claims;
using FilRouge_TicketMaster_MVC_Core.Database;
using SignInResult = Microsoft.AspNetCore.Identity.SignInResult;
using FilRouge_TicketMaster_MVC_Core.Areas.Identity.Pages.Account;
using Microsoft.EntityFrameworkCore;


namespace FilRouge_TicketMaster_MVC_Core.Tests.Controllers
{
    [TestFixture]
    public class HomeControllerTests
    {
        private Mock<SignInManager<IdentityUser>> _mockSignInManager;
        private Mock<ILogger<LoginModel>> _mockLogger;
        private TicketMasterDatabaseContext _context;
        private Mock<UserManager<IdentityUser>> _mockUserManager;
        private HomeController _controller;

        [SetUp]
        public void SetUp()
        {
            var options = new DbContextOptionsBuilder<TicketMasterDatabaseContext>()
                .UseInMemoryDatabase(databaseName: "TicketMasterTestDb")
                .Options;
            _context = new TicketMasterDatabaseContext(options);

            var userStore = new Mock<IUserStore<IdentityUser>>();
            _mockUserManager = new Mock<UserManager<IdentityUser>>(userStore.Object, null, null, null, null, null, null, null, null);

            var contextAccessor = new Mock<IHttpContextAccessor>();
            var userPrincipalFactory = new Mock<IUserClaimsPrincipalFactory<IdentityUser>>();
            _mockSignInManager = new Mock<SignInManager<IdentityUser>>(
                _mockUserManager.Object,
                contextAccessor.Object,
                userPrincipalFactory.Object,
                null, null, null, null);

            _mockLogger = new Mock<ILogger<LoginModel>>();

            _controller = new HomeController(_mockSignInManager.Object, _mockLogger.Object, _context, _mockUserManager.Object);
        }

        [TearDown]
        public void TearDown()
        {
            _controller?.Dispose();
            _context?.Dispose();
        }

        [Test]
        public async Task Index_WhenUserIsAuthenticatedAndIsCustomer_RedirectsToCustomerDashboard()
        {
            // Arrange
            var user = new IdentityUser { Id = "1" };
            _mockUserManager.Setup(um => um.GetUserAsync(It.IsAny<ClaimsPrincipal>())).ReturnsAsync(user);

            _mockUserManager.Setup(um => um.IsInRoleAsync(user, "Customer")).ReturnsAsync(true);

            _controller.ControllerContext = new ControllerContext();
            _controller.ControllerContext.HttpContext = new DefaultHttpContext();
            _controller.ControllerContext.HttpContext.User = new ClaimsPrincipal(
                new ClaimsIdentity(new List<Claim>
                {
            new Claim(ClaimTypes.NameIdentifier, "1")
                }, "mock"));

            // Act
            var result = await _controller.Index() as RedirectToActionResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.ActionName);
            Assert.AreEqual("CustomerDashboard", result.ControllerName);
            Assert.AreEqual(user.Id, result.RouteValues["id"]);
        }

        [Test]
        public async Task Index_WhenUserIsAuthenticatedAndIsNotCustomer_RedirectsToUserDashboard()
        {
            // Arrange
            var user = new IdentityUser { Id = "1" };
            _mockUserManager.Setup(um => um.GetUserAsync(It.IsAny<ClaimsPrincipal>())).ReturnsAsync(user);
            _mockUserManager.Setup(um => um.IsInRoleAsync(user, "Customer")).ReturnsAsync(false);
            _controller.ControllerContext = new ControllerContext();
            _controller.ControllerContext.HttpContext = new DefaultHttpContext();
            _controller.ControllerContext.HttpContext.User = new ClaimsPrincipal(
                new ClaimsIdentity(new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, "1")
                }, "mock"));

            // Act
            var result = await _controller.Index() as RedirectToActionResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.ActionName);
            Assert.AreEqual("UserDashboard", result.ControllerName);
            Assert.AreEqual(user.Id, result.RouteValues["id"]);
        }

        [Test]
        public async Task Index_WhenUserIsNotAuthenticated_ReturnsView()
        {
            // Arrange
            _controller.ControllerContext = new ControllerContext();
            _controller.ControllerContext.HttpContext = new DefaultHttpContext();
            _controller.ControllerContext.HttpContext.User = new ClaimsPrincipal(
                new ClaimsIdentity());

            // Act
            var result = await _controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [Test]
        public async Task IndexPost_WithValidModelAndSuccessfulLoginAsCustomer_RedirectsToCustomerDashboard()
        {
            // Arrange
            var viewModel = new HomeLoginViewModel { Mail = "test@test.com", Password = "Password123" };
            _mockSignInManager.Setup(sm => sm.PasswordSignInAsync(viewModel.Mail, viewModel.Password, true, false))
                .ReturnsAsync(SignInResult.Success);
            var user = new IdentityUser { Id = "1", Email = viewModel.Mail };
            _mockUserManager.Setup(um => um.FindByEmailAsync(viewModel.Mail)).ReturnsAsync(user);
            _mockUserManager.Setup(um => um.IsInRoleAsync(user, "Customer")).ReturnsAsync(true);

            // Act
            var result = await _controller.Index(viewModel) as RedirectToActionResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.ActionName);
            Assert.AreEqual("CustomerDashboard", result.ControllerName);
            Assert.AreEqual(user.Id, result.RouteValues["id"]);
        }

        [Test]
        public async Task IndexPost_WithValidModelAndSuccessfulLoginAsUser_RedirectsToUserDashboard()
        {
            // Arrange
            var viewModel = new HomeLoginViewModel { Mail = "test@test.com", Password = "Password123" };
            _mockSignInManager.Setup(sm => sm.PasswordSignInAsync(viewModel.Mail, viewModel.Password, true, false))
                .ReturnsAsync(SignInResult.Success);
            var user = new IdentityUser { Id = "1", Email = viewModel.Mail };
            _mockUserManager.Setup(um => um.FindByEmailAsync(viewModel.Mail)).ReturnsAsync(user);
            _mockUserManager.Setup(um => um.IsInRoleAsync(user, "Technician")).ReturnsAsync(true);

            // Act
            var result = await _controller.Index(viewModel) as RedirectToActionResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.ActionName);
            Assert.AreEqual("UserDashboard", result.ControllerName);
            Assert.AreEqual(user.Id, result.RouteValues["id"]);
        }

        [Test]
        public async Task IndexPost_WithInvalidModel_ReturnsViewWithErrors()
        {
            // Arrange
            _controller.ModelState.AddModelError("error", "error");

            // Act
            var result = await _controller.Index(new HomeLoginViewModel()) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsFalse(result.ViewData.ModelState.IsValid);
        }
    }
}
