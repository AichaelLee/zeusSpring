package com.lzz.form;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Data
public class GSC010101_PasswordResetResource implements Serializable {

	private static final long serialVersionUID = 1L;

    public interface EmailChk {
    }

    public interface PasswordChk {
    }

   // @NotEmpty(groups = EmailChk.class)
   // @Email(groups = EmailChk.class)
   // private String email;

    @Size(min=6, groups = PasswordChk.class)
    private String password;

    @Size(min=6, groups = PasswordChk.class)
    private String password2;

    @AssertTrue(message="パスワードが一致しません。",groups = PasswordChk.class)
    private boolean isValid() {
        return StringUtils.equals(password, password2);
    }
}
