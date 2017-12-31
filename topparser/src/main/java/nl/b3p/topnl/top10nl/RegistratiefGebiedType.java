//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2017.01.10 at 11:33:39 AM CET 
//


package nl.b3p.topnl.top10nl;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import org.w3c.dom.Element;


/**
 * <p>Java class for RegistratiefGebiedType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="RegistratiefGebiedType">
 *   &lt;complexContent>
 *     &lt;extension base="{http://register.geostandaarden.nl/gmlapplicatieschema/top10nl/1.2.0}_Top10nlObjectType">
 *       &lt;sequence>
 *         &lt;element name="typeRegistratiefGebied" type="{http://www.opengis.net/gml/3.2}CodeType"/>
 *         &lt;element name="naamOfficieel" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="naamNL" type="{http://www.w3.org/2001/XMLSchema}string" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="naamFries" type="{http://www.w3.org/2001/XMLSchema}string" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="nummer" type="{http://www.w3.org/2001/XMLSchema}string" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="geometrie" type="{http://register.geostandaarden.nl/gmlapplicatieschema/brt-algemeen/1.2.0}BRTVlakOfMultivlakPropertyType"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RegistratiefGebiedType", namespace = "http://register.geostandaarden.nl/gmlapplicatieschema/top10nl/1.2.0", propOrder = {
    "typeRegistratiefGebied",
    "naamOfficieel",
    "naamNL",
    "naamFries",
    "nummer",
    "geometrie"
})
public class RegistratiefGebiedType
    extends Top10NlObjectType
{

    @XmlElement(required = true)
    protected CodeType typeRegistratiefGebied;
    @XmlElement(required = true)
    protected String naamOfficieel;
    protected List<String> naamNL;
    protected List<String> naamFries;
    protected List<String> nummer;
    @XmlAnyElement
    protected Element geometrie;

    /**
     * Gets the value of the typeRegistratiefGebied property.
     * 
     * @return
     *     possible object is
     *     {@link CodeType }
     *     
     */
    public CodeType getTypeRegistratiefGebied() {
        return typeRegistratiefGebied;
    }

    /**
     * Sets the value of the typeRegistratiefGebied property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeType }
     *     
     */
    public void setTypeRegistratiefGebied(CodeType value) {
        this.typeRegistratiefGebied = value;
    }

    /**
     * Gets the value of the naamOfficieel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNaamOfficieel() {
        return naamOfficieel;
    }

    /**
     * Sets the value of the naamOfficieel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNaamOfficieel(String value) {
        this.naamOfficieel = value;
    }

    /**
     * Gets the value of the naamNL property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the naamNL property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getNaamNL().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getNaamNL() {
        if (naamNL == null) {
            naamNL = new ArrayList<String>();
        }
        return this.naamNL;
    }

    /**
     * Gets the value of the naamFries property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the naamFries property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getNaamFries().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getNaamFries() {
        if (naamFries == null) {
            naamFries = new ArrayList<String>();
        }
        return this.naamFries;
    }

    /**
     * Gets the value of the nummer property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the nummer property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getNummer().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getNummer() {
        if (nummer == null) {
            nummer = new ArrayList<String>();
        }
        return this.nummer;
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