using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System;
using TechTalk.SpecFlow;

namespace test_7_lab.StepDefinitions
{
    [Binding]
    public class WikipediaSearchSteps
    {
        private IWebDriver _driver;
        private WebDriverWait _wait;

        public WikipediaSearchSteps()
        {
            _driver = new ChromeDriver();
            _wait = new WebDriverWait(_driver, TimeSpan.FromSeconds(10));
        }

        [Given(@"I am on the Wikipedia homepage")]
        public void GivenIAmOnTheWikipediaHomepage()
        {
            _driver.Navigate().GoToUrl("https://www.wikipedia.org/");
        }

        [When(@"I enter ""(.*)"" into the search field")]
        public void WhenIEnterIntoTheSearchField(string searchText)
        {
            _driver.FindElement(By.Id("searchInput")).SendKeys(searchText);
        }

        [When(@"I press the search button")]
        public void WhenIPressTheSearchButton()
        {
            _driver.FindElement(By.CssSelector("button[type='submit']")).Click();
        }

        [Then(@"I should see the search results for ""(.*)""")]
        public void ThenIShouldSeeTheSearchResultsFor(string searchText)
        {
            _wait.Until(d => d.FindElement(By.Id("firstHeading")).Displayed);
            Assert.Contains(searchText, _driver.PageSource);
        }

        [Then(@"I should see a message indicating no results were found")]
        public void ThenIShouldSeeAMessageIndicatingNoResultsWereFound()
        {
            var noResultElement = _driver.FindElement(By.CssSelector(".mw-search-nonefound"));
            Assert.True(noResultElement.Displayed);
        }

        [Then(@"I should stay on the homepage")]
        public void ThenIShouldStayOnTheHomepage()
        {
            Assert.Equal("https://www.wikipedia.org/", _driver.Url);
        }

        [AfterScenario]
        public void DisposeWebDriver()
        {
            _driver.Quit();
        }
    }
}
