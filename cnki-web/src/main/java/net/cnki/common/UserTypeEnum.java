package net.cnki.common;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/1.
 */
public enum UserTypeEnum {

    /**
     * 学生
     */
    STUDENT("学生","3"),

    /**
     * 管理员
     */
    ADMIN("管理员","1"),

    /**
     * 教师
     */
    TEACHER("教师","2");

    private String userTypeZh;
    private String userType;


    UserTypeEnum(String userTypename,String userType){
        this.userTypeZh = userTypename;
        this.userType = userType;

    }

    public  String getUserType(){
        return this.userType;
    }

    /**
     *
     * @param userType
     * @return 用户类型的中文名称
     */
    public static String getUserTypeZh(String userType){

        for(UserTypeEnum value:UserTypeEnum.values()){
            if(value.getUserType().equals(userType)){
               return  value.userTypeZh;
            }

        }
        return null;
    }


}
