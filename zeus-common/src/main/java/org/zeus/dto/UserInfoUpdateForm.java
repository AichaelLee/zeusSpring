package org.zeus.dto;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import springfox.documentation.annotations.ApiIgnore;

@Data
public class UserInfoUpdateForm {

    private Integer schoolNum;
    private Long id;

    @ApiModelProperty("本人姓名")
    private String teacherName;

    @ApiModelProperty("本人学位")
    private String academicDegree;

    @ApiModelProperty("毕业学校")
    private String graduatedUniversity;

    @ApiModelProperty("职称")
    private String title;

    public boolean isEmpty(){
        if(StringUtils.isEmpty(this.getTeacherName())
                &&StringUtils.isEmpty(this.getGraduatedUniversity())
                &&StringUtils.isEmpty(this.getAcademicDegree())
                && StringUtils.isEmpty(this.getTitle())){
            return true;
        }else{
            return false;
        }
    }



}
