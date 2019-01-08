package org.zeus.dto;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;
@Data
public class PassWordResetResource {
    public interface PasswordChk {

    }
    @Size(min=3,groups = PasswordChk.class)
    private String password;

    @Size(min=3,groups = PasswordChk.class)
    private String password2;

    @AssertTrue(message = "密码输入不一致，请重新输入",groups = PasswordChk.class)
    private boolean isValid(){
        return StringUtils.equals(password,password2);
    }

}
