/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.atsamour.habitatweave.util;

public class AutoCompleteData {
    private final String label;
    private final String value;
    private final String desc;
    

    public AutoCompleteData(String _label, String _value, String _desc) {
        super();
        this.label = _label;
        this.value = _value;
        this.desc = _desc;
    }

    public final String getLabel() {
        return this.label;
    }

    public final String getValue() {
        return this.value;
    }

    public final String getDesc() {
        return this.desc;
    }
}