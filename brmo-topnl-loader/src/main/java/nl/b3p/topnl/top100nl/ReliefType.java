//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.12.07 at 02:40:39 PM CET 
//


package nl.b3p.topnl.top100nl;

import java.math.BigInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import org.w3c.dom.Element;


/**
 * <p>Java class for ReliefType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ReliefType">
 *   &lt;complexContent>
 *     &lt;extension base="{http://register.geostandaarden.nl/gmlapplicatieschema/top100nl/1.1.0}_Top100nlObjectType">
 *       &lt;sequence>
 *         &lt;element name="typeRelief" type="{http://register.geostandaarden.nl/gmlapplicatieschema/top100nl/1.1.0}TypeReliefT100Type"/>
 *         &lt;element name="hoogteklasse" type="{http://register.geostandaarden.nl/gmlapplicatieschema/top100nl/1.1.0}HoogteklasseReliefT100Type" minOccurs="0"/>
 *         &lt;element name="functie" type="{http://register.geostandaarden.nl/gmlapplicatieschema/top100nl/1.1.0}FunctieReliefT100Type" minOccurs="0"/>
 *         &lt;element name="naamFries" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="naamNL" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="hoogteniveau" type="{http://www.w3.org/2001/XMLSchema}integer"/>
 *         &lt;element name="geometrie" type="{http://www.opengis.net/gml/3.2}CurvePropertyType"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ReliefType", namespace = "http://register.geostandaarden.nl/gmlapplicatieschema/top100nl/1.1.0", propOrder = {
    "typeRelief",
    "hoogteklasse",
    "functie",
    "naamFries",
    "naamNL",
    "hoogteniveau",
    "geometrie"
})
public class ReliefType
    extends Top100NlObjectType
{

    @XmlElement(required = true)
    @XmlSchemaType(name = "string")
    protected TypeReliefT100Type typeRelief;
    protected String hoogteklasse;
    @XmlSchemaType(name = "string")
    protected FunctieReliefT100Type functie;
    protected String naamFries;
    protected String naamNL;
    @XmlElement(required = true)
    protected BigInteger hoogteniveau;
    @XmlAnyElement
    protected Element geometrie;

    /**
     * Gets the value of the typeRelief property.
     * 
     * @return
     *     possible object is
     *     {@link TypeReliefT100Type }
     *     
     */
    public TypeReliefT100Type getTypeRelief() {
        return typeRelief;
    }

    /**
     * Sets the value of the typeRelief property.
     * 
     * @param value
     *     allowed object is
     *     {@link TypeReliefT100Type }
     *     
     */
    public void setTypeRelief(TypeReliefT100Type value) {
        this.typeRelief = value;
    }

    /**
     * Gets the value of the hoogteklasse property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHoogteklasse() {
        return hoogteklasse;
    }

    /**
     * Sets the value of the hoogteklasse property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHoogteklasse(String value) {
        this.hoogteklasse = value;
    }

    /**
     * Gets the value of the functie property.
     * 
     * @return
     *     possible object is
     *     {@link FunctieReliefT100Type }
     *     
     */
    public FunctieReliefT100Type getFunctie() {
        return functie;
    }

    /**
     * Sets the value of the functie property.
     * 
     * @param value
     *     allowed object is
     *     {@link FunctieReliefT100Type }
     *     
     */
    public void setFunctie(FunctieReliefT100Type value) {
        this.functie = value;
    }

    /**
     * Gets the value of the naamFries property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNaamFries() {
        return naamFries;
    }

    /**
     * Sets the value of the naamFries property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNaamFries(String value) {
        this.naamFries = value;
    }

    /**
     * Gets the value of the naamNL property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNaamNL() {
        return naamNL;
    }

    /**
     * Sets the value of the naamNL property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNaamNL(String value) {
        this.naamNL = value;
    }

    /**
     * Gets the value of the hoogteniveau property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getHoogteniveau() {
        return hoogteniveau;
    }

    /**
     * Sets the value of the hoogteniveau property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setHoogteniveau(BigInteger value) {
        this.hoogteniveau = value;
    }

    /**
     * Gets the value of the geometrie property.
     * 
     * @return
     *     possible object is
     *     {@link Element }
     *     
     */
    public Element getGeometrie() {
        return geometrie;
    }

    /**
     * Sets the value of the geometrie property.
     * 
     * @param value
     *     allowed object is
     *     {@link Element }
     *     
     */
    public void setGeometrie(Element value) {
        this.geometrie = value;
    }

}