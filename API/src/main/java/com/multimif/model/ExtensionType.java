package com.multimif.model;

/**
 * Les extensions utilisées
 */
public enum ExtensionType {
    JAVA("java"),
    CPP("cpp");


    public final String extension;

    ExtensionType(String extension){
        this.extension = extension;
    }

    public String getExtension() {
        return extension;
    }
}
