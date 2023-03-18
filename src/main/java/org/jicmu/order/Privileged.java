package org.jicmu.order;

public enum Privileged {

    PLAN(1)
    , ORDER(2)
    , RECEIPT(3)
    , RELEASING(4);


    private final Integer privileged;


    Privileged(Integer privileged) {
        this.privileged = privileged;
    }


    public Integer getPrivileged() {
        return privileged;
    }
}
