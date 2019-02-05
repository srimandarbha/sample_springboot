import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;
import java.util.Date;

@RestController
@EnableAutoConfiguration
public class Example {

    Date date = new Date();

	@RequestMapping("/")
	String home() {
		return "Hello" + " Sriman!, Time now is " + date.toString();
	}

	public static void main(String[] args) {
		SpringApplication.run(Example.class, args);
	}

}
