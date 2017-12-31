//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.12.07 at 02:40:39 PM CET 
//


package nl.b3p.topnl.top100nl;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for FysiekVoorkomenWaterT100Type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="FysiekVoorkomenWaterT100Type">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="in sluis"/>
 *     &lt;enumeration value="op brug"/>
 *     &lt;enumeration value="in duiker"/>
 *     &lt;enumeration value="in afsluitbare duiker"/>
 *     &lt;enumeration value="in grondduiker"/>
 *     &lt;enumeration value="in afsluitbare grondduiker"/>
 *     &lt;enumeration value="overkluisd"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "FysiekVoorkomenWaterT100Type", namespace = "http://register.geostandaarden.nl/gmlapplicatieschema/top100nl/1.1.0")
@XmlEnum
public enum FysiekVoorkomenWaterT100Type {

    @XmlEnumValue("in sluis")
    IN_SLUIS("in sluis"),
    @XmlEnumValue("op brug")
    OP_BRUG("op brug"),
    @XmlEnumValue("in duiker")
    IN_DUIKER("in duiker"),
    @XmlEnumValue("in afsluitbare duiker")
    IN_AFSLUITBARE_DUIKER("in afsluitbare duiker"),
    @XmlEnumValue("in grondduiker")
    IN_GRONDDUIKER("in grondduiker"),
    @XmlEnumValue("in afsluitbare grondduiker")
    IN_AFSLUITBARE_GRONDDUIKER("in afsluitbare grondduiker"),
    @XmlEnumValue("overkluisd")
    OVERKLUISD("overkluisd");
    private final String value;

    FysiekVoorkomenWaterT100Type(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static FysiekVoorkomenWaterT100Type fromValue(String v) {
        for (FysiekVoorkomenWaterT100Type c: FysiekVoorkomenWaterT100Type.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}