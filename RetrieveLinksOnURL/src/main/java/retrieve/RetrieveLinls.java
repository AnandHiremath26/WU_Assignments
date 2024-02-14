package retrieve;

import java.util.List;
import java.util.stream.Collectors;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class RetrieveLinls {

	public static void main(String[] args) {

		// Make sure you have the ChromeDriver executable and set its path
		System.setProperty("webdriver.chrome.driver", "./Drivers/chromedriver.exe");

		// Initialize ChromeDriver
		WebDriver driver = new ChromeDriver();

		// Navigate to the URL
		driver.get("https://www.flipkart.com/");
		try {
			System.out.println("i. Using for-each loop:");
			List<WebElement> links = driver.findElements(By.tagName("a"));
			for (WebElement link : links) {
				System.out.println(link.getAttribute("href"));
			}

			System.out.println("\nii. Using Stream:");
			List<WebElement> slinks = driver.findElements(By.tagName("a"));
			List<String> streamLinks=slinks .stream()
					.map(WebElement::getText).collect(Collectors.toList());
			streamLinks.stream()
			.forEach(System.out::println);

			System.out.println("\niii. Using Parallel Stream:");
			List<WebElement> pslinks = driver.findElements(By.tagName("a"));
			List<String> parastreamLinks=pslinks .parallelStream()
					.map(WebElement::getText).collect(Collectors.toList());
			parastreamLinks.parallelStream()
			.forEach(System.out::println);

			System.out.println("\niV. Using Lambda Expression:");
			List<WebElement> llinks = driver.findElements(By.tagName("a"));
			llinks.forEach(link -> System.out.println(link.getAttribute("href")));

			driver.quit();
		} catch (Exception e) {
			e.getMessage();
		}

	}

}
