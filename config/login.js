// It is used for login before testing page performance (pre-script)
module.exports = {
  run(context) {
    return context.runWithDriver((driver) => {
      return driver.get('https://platform.qa.cloud.bionexo.com.br')
        .then(() => {

          const webdriver = context.webdriver;
          const until = webdriver.until;
          const By = webdriver.By;

          const userName = 'qafornecedor@bionexo.com';
          const password = 'Bio@1234';

          const loginForm = driver.findElement(By.id('new_user'));
          driver.sleep(1000);
      
          driver.findElement(By.css('#user_login_application > option:nth-child(2)')).click();
          driver.findElement(By.id('user_email')).sendKeys(userName);
          driver.findElement(By.id('nextStep')).click();
          
          driver.sleep(1000);
          driver.findElement(By.id('user_password')).sendKeys(password);

          driver.findElement(webdriver.By.id('sign_in')).click();
  
          return driver.wait(until.elementLocated(By.id('biobar-menu-toggle')), 3000);
        });
    })
  }
};