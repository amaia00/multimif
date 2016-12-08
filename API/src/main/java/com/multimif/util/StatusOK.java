package com.multimif.util;

/**
 * Renvoi un status valide
 */
public class StatusOK extends Status {
    private Long id;

    public StatusOK(){
        /* On ajoute le constructeur par défaut parce que dans les controllers on doit declarer
        * le response entity de ce type là.*/
    }

    /**
     * @param code le code 0 si la transaction a fini correctemente
     * @param message le message à la fin de la transaction
     * @param id l'identificateur de l'entité qui veut s'envoyer
     */
    public StatusOK(int code, String message, Long id){
        super(code, message);
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
