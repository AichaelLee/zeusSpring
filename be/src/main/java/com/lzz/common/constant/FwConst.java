package com.lzz.common.constant;

public final class FwConst {

    public static final String OPERATION_LOG_ID = "[OPERATION_LOG_ID]";
    public static final String OPERATION_START = "[OPERATION_START]";
    public static final String OPERATION_END = "[OPERATION_END]";
    public static final String SEARCH_LOG_ID = "[SEARCH_LOG_ID]";
    public static final String UPDATE_LOG_ID = "[UPDATE_LOG_ID]";
    public static final String EXCEPTION_LOG_ID = "[EXCEPTION_LOG_ID]";

    public static final String USER_ID = "USER_ID";
    public static final String OPERATION_ID = "OPERATION_ID";
    public static final String OPERATION_PARAMS = "OPERATION_PARAMS";
    public static final String OPERATION_DURATION = "OPERATION_DURATION";

    public static final String COURSE_CD_HONSYA = "000000";
    public static final String COURSE_CD_CHUJU = "000101";
    public static final String COURSE_CD_KOUJU = "000201";
    public static final String COURSE_CD_KOBETSU = "000301";
    public static final String COURSE_CD_DAIJU = "000401";
    public static final String COURSE_CD_EPION = "000501";
    public static final String COURSE_CD_S_EPION = "000502";
    public static final String COURSE_CD_CHUKOU = "000601";
    public static final String COURSE_CD_TEIGAKUNEN = "000701";
    public static final String COURSE_CD_MOEGI = "000702";
    public static final String COURSE_CD_KIDS = "000703";
    public static final String COURSE_CD_KANRI = "000801";
    public static final String COURSE_CD_JINZAI = "000901";
    public static final String COURSE_CD_KYOUMU = "001001";

    /**
     * 乐观锁失败ID
     */
    public static final String OPTIMISTIC_LOCKING_FAILURE = "MFW01E031";

    /**
     * 乐观锁状态ID
     */
    public static final String OPTIMISTIC_LOCKING_STUDENT = "MFW01E037";

    /**
     * 文件错误
     */
    public static final String FILE_ERROR = "MFW01E043";

    /**
     * 参数错误
     */
    public static final String PARAMETER_ERROR = "MFW01E045";

    /**
     * 权限检查
     */
    public static final String AUTHORITY_CHECK_ERROR = "MFW01E047";

    /**
     * 下载异常
     */
    public static final String FILE_DOWNLOAD_ERROR = "MFW01E048";

    /**
     * 其他错误
     */
    public static final String UNKNOWN_ERROR = "MFW01E036";

    /**
     * 登录ID
     */
    public static final String SESSION_KEY_LOGIN_ID = "LOGIN_ID";

    /**
     * 登录用户名
     */
    public static final String SESSION_KEY_LOGIN_USER_NAME = "LOGIN_USER_NAME";

    /**
     * 系统错误
     */
    public static final String SYSTEM_ERROR_PAGE = "FW10000_ApplicationError";

    private FwConst() {
    }

}
