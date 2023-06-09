package test.spring.component;

import lombok.Data;

@Data
public class SignUpDTO {
    private String id;
    private String pw;
    private String name;
    private String phone;
    private String nick;
    private String ssn;
    private String email;
}
