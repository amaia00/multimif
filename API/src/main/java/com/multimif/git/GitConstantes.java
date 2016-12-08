package com.multimif.git;

/**
 * Contient les constantes pour GIT
 */
public class GitConstantes {

    public static final String REPOPATH = "repositories/";

    public static final String REPO_FULLPATH = System.getProperty("user.dir") + "/" + REPOPATH;

    public static final String APPLICATION_JSON_UTF8 = "application/json;charset=UTF-8";

    public static final String ZIP_DIRECTORY =  System.getProperty("user.dir") + "/API/src/main/webapp/zipFiles/";

    public static final String GIT_EXTENSION = ".git";

    public static final String ZIP_EXTENSION = ".zip";

    public GitConstantes(){
        /* On chache le constructeur */
    }

}
