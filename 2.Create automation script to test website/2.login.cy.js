/// <reference types="cypress" />

const BASE_URL = 'http://the-internet.herokuapp.com';
const LOGIN_URL = `${BASE_URL}/login`;

const credentials = {
  username: 'tomsmith',
  usernameIncorrect: 'tomholland',
  password: 'SuperSecretPassword!',
  passwordIncorrect: 'Password!'
};

const selectors = {
  username: '#username',
  usernameIncorrect: '#username',
  password: '#password',
  passwordIncorrect: '#password',
  loginButton: 'button[type="submit"]',
  logoutButton: 'a.button.secondary.radius',
  loginSucessMessage: 'You logged out of the secure area!',
  loginUsernameIncorrect: 'Your usernameis invalid!',
  loginPasswordIncorrect: 'Your password is invalid!'
};

describe('TC1 : Login success ', () => {
  it('Should login with valid credentials and then logout.', () => {
    // Visit Login Page
    cy.visit(LOGIN_URL);

    // Fill in credentials
    cy.get(selectors.username).type(credentials.username);
    cy.get(selectors.password).type(credentials.password);
    cy.get(selectors.loginButton).click();

    // Click logout
    cy.get(selectors.logoutButton).click();

    // Verify logout
    cy.url().should('include', '/login');
    cy.contains(selectors.loginSucessMessage).should('be.visible');
  });
});



describe('TC2 : In Case Login failed Password incorrect ', () => {
  it('The System display error message when input password incorrect.', () => {
    // Visit Login Page
    cy.visit(LOGIN_URL);

    // Fill in credentials
    cy.get(selectors.username).type(credentials.username);
    cy.get(selectors.passwordIncorrect).type(credentials.passwordIncorrect);
    cy.get(selectors.loginButton).click();

     // Verify logout
    cy.url().should('include', '/login');
    cy.contains(selectors.loginPasswordIncorrect).should('be.visible');

  });
});


describe('TC3 : Login failed Username not found ', () => {
  it('The System display error message when input username incorrect.', () => {
    // Visit Login Page
    cy.visit(LOGIN_URL);

    // Fill in credentials
    cy.get(selectors.usernameIncorrect).type(credentials.usernameIncorrect);
    cy.get(selectors.password).type(credentials.password);
    cy.get(selectors.loginButton).click();

     // Verify logout
    cy.url().should('include', '/login');
    cy.contains(selectors.loginUsernameIncorrect).should('be.visible');

    /*
    case นี้จะไม่ผ่านเพราะหน้าเว็บแสดง msg = 'Your username is invalid!'  แต่ใน Test Case check msg = 'Your usernameis invalid!'
     */

  });
});








