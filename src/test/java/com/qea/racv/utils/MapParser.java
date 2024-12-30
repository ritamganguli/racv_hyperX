package com.qea.racv.utils;

import com.qea.racv.repo.Global;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * MapParser handles the object map.
 */
public class MapParser {
  private DocumentBuilderFactory factoryObjectParser;
  private DocumentBuilder builderObjectParser;
  private Document documentObjectParser;
  private XPath xpathObjectParser;

  private DocumentBuilderFactory factoryCopyParser;
  private DocumentBuilder builderCopyParser;
  private Document documentCopyParser;
  private XPath xpathCopyParser;

  private DocumentBuilderFactory factoryDataMapParser;
  private DocumentBuilder builderDataMapParser;
  private Document documentDataMapParser;
  private XPath xpathDataMapParser;

  private Global objGlobal;

  /**
   * MapParser constructor.
   *
   * @param objGlobal Global object
   * @throws ParserConfigurationException ParserConfigurationException
   * @throws SAXException SAXException
   * @throws IOException IOException
   */
  public MapParser(Global objGlobal)
      throws ParserConfigurationException, SAXException, IOException {
    // Use XPATH factories so we can easily search our XML maps and keep the whole file in memory
    // and re use for searching

    // Object map
    factoryObjectParser = DocumentBuilderFactory.newInstance();
    factoryObjectParser.setIgnoringComments(true);
    // parse CDATA tags
    factoryObjectParser.setCoalescing(true);
    builderObjectParser = factoryObjectParser.newDocumentBuilder();
    documentObjectParser = builderObjectParser.parse(
        new InputSource(new BufferedReader(new FileReader(ReadConfigProps.getObjectMapPath()))));
    xpathObjectParser = XPathFactory.newInstance().newXPath();

    // Copy map
    factoryCopyParser = DocumentBuilderFactory.newInstance();
    factoryCopyParser.setIgnoringComments(true);
    // parse CDATA tags
    factoryCopyParser.setCoalescing(true);
    builderCopyParser = factoryCopyParser.newDocumentBuilder();
    documentCopyParser = builderCopyParser.parse(
        new InputSource(new BufferedReader(new FileReader(ReadConfigProps.getCopyMapPath()))));
    xpathCopyParser = XPathFactory.newInstance().newXPath();

    // DataMap map
    factoryDataMapParser = DocumentBuilderFactory.newInstance();
    factoryDataMapParser.setIgnoringComments(true);
    // parse CDATA tags
    factoryDataMapParser.setCoalescing(true);
    builderDataMapParser = factoryDataMapParser.newDocumentBuilder();
    documentDataMapParser = builderDataMapParser.parse(
        new InputSource(new BufferedReader(new FileReader(ReadConfigProps.getDataMapPath()))));
    xpathDataMapParser = XPathFactory.newInstance().newXPath();

    this.objGlobal = objGlobal;
  }

  /**
   * Object parser to read objectmap xml and return a locator for field provided.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return xpath Locator for field
   * @throws Exception When no field or screen doesn't exist
   */
  public String objectParser(String objectName, String screenName) throws Exception {
    // If screename is XPATH we are using direct xpaths in the cucumber
    if (screenName.equals("XPATH")) {
      return objGlobal.parseTextToType(objectName);
    }

    // Search the XML file by constructing a XPATH string
    final String xpathString =
        "//screen[@screenId=\"" + screenName + "\"]/xpath[@objectId=\"" + objectName + "\"]/text()";
    final String result = (String) xpathObjectParser.evaluate(xpathString, documentObjectParser,
        XPathConstants.STRING);
    if (result == null || result.equals("")) {
      throw new Exception("Field: " + objectName + " or Screen name: " + screenName
          + " does not exist in the object map");
    }
    return result;
  }

  /**
   * Data Map parser to read datamap and return a value for field provided.
   *
   * @param dataId The Data ID
   * @param environment The environment for the given Data ID
   * @return value Value of key pair
   * @throws Exception When no environment or data id doesn't exist
   */
  public String dataMapParser(String dataId, String environment) throws Exception {
    // Search the XML file by constructing a XPATH string
    final String xpathString =
        "//data[@id=\"" + dataId + "\"]/value[@environment=\"" + environment + "\"]/text()";
    final String result = (String) xpathDataMapParser.evaluate(xpathString, documentDataMapParser,
        XPathConstants.STRING);
    if (result == null || result.equals("")) {
      throw new Exception("Data field: " + dataId + " or environment: " + environment
          + " does not exist in the object map");
    }
    return result;
  }

  /**
   * Object parser to read copy map xml and return a locator for field provided.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return xpath Locator for field
   * @throws Exception When no field or screen doesn't exist
   */
  public String copyParser(String objectName, String screenName) throws Exception {
    // If screename is XPATH we are using direct xpaths in the cucumber
    if (screenName.equals("XPATH")) {
      return objGlobal.parseTextToType(objectName);
    }

    // Search the XML file by constructing a XPATH string
    final String xpathString =
        "//screen[@screenId=\"" + screenName + "\"]/copy[@objectId=\"" + objectName + "\"]/text()";
    final String result =
        (String) xpathCopyParser.evaluate(xpathString, documentCopyParser, XPathConstants.STRING);
    if (result == null || result.equals("")) {
      throw new Exception("Field: " + objectName + " or Screen name: " + screenName
          + " does not exist in the copy map");
    }
    return result;
  }
}
