package vn.banhmi.gobread.service;


import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;

import java.util.Map;

@Service
public class FlaskChatService {

    public String askFlask(String question) {
        String flaskUrl = "http://127.0.0.1:5000";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String jsonBody = String.format("{\"question\": \"%s\"}", question);

        HttpEntity<String> entity = new HttpEntity<>(jsonBody, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(flaskUrl, entity, Map.class);
            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                return (String) response.getBody().get("answer");
            } else {
                return "Không nhận được phản hồi từ chatbot.";
            }
        } catch (Exception e) {
            return "Lỗi khi gọi Flask: " + e.getMessage();
        }
    }
}
