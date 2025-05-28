package vn.banhmi.gobread.service.validatior;

import vn.banhmi.gobread.domain.dto.RegisterDTO;

public class RegisterValidator implements jakarta.validation.ConstraintValidator<RegisterChecked, RegisterDTO> {

    @Override
    public boolean isValid(RegisterDTO user, jakarta.validation.ConstraintValidatorContext context) {
        boolean isValid = true;
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Mật khẩu và xác nhận mật khẩu không khớp")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();
            isValid = false;

        }
        return isValid; // Placeholder for actual validation logic
    }

}
