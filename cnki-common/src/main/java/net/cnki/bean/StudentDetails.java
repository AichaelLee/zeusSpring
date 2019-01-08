package net.cnki.bean;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Arrays;
import java.util.Collection;

/**
 * Created by aichaellee on 2018/11/28.
 */
public class StudentDetails extends User {

    private final TblStudentBase studentBase;

    public StudentDetails(TblStudentBase studentBase, Collection<? extends GrantedAuthority> authorities){
        super(studentBase.getUsername(),studentBase.getPassword(),authorities);
        this.studentBase = studentBase;
    }

    public TblStudentBase getStudent(){
        Role aa = new Role();
        aa.setName("ROLE_xixi");
        studentBase.setRoles(Arrays.asList(aa));
        return studentBase;
    }

}
