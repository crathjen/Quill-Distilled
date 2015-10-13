package quotes.services;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import quotes.jpa.entities.Quotation;

@Controller
public class ServiceController {

	@RequestMapping(path = "/authorLN", produces = "application/json")
	public @ResponseBody Quotation authorSearchLN(){
		return new Quotation();
	}
}
