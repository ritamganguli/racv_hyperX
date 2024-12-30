package com.qea.racv.utils;

/*
 * Copyright (C) 2020 Deque Systems Inc.,
 *
 * Your use of this Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
 * If a copy of the MPL was not distributed with this file, You can obtain one at
 * http://mozilla.org/MPL/2.0/.
 *
 * This entire copyright notice must appear in every copy of this file you distribute or in any file
 * that contains substantial portions of this source code.
 */
/*
 * From: https://github.com/dequelabs/axe-core-maven-html/pull/118/files Additional code from:
 * https://github.com/TroyWalshProf/SeleniumAxeDotnet/blob/main/Selenium.Axe/Selenium.Axe/HtmlReport
 * .cs
 */
import com.deque.html.axecore.results.Check;
import com.deque.html.axecore.results.CheckedNode;
import com.deque.html.axecore.results.Node;
import com.deque.html.axecore.results.ResultType;
import com.deque.html.axecore.results.Results;
import com.deque.html.axecore.results.Rule;
import com.deque.html.axecore.selenium.AxeBuilder;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.apache.commons.text.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Tag;
import org.openqa.selenium.SearchContext;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WrapsElement;

/**
 * Axe Deque reports handling.
 */
public class AxeHtmlReporter {
  private static final AxeBuilder AXE_BUILDER = new AxeBuilder();

  private AxeHtmlReporter() {}

  public static void createAxeHtmlViolationsReport(WebDriver webDriver, String destination,
      boolean returnBodyOnly) throws IOException, ParseException {
    createAxeHtmlViolationsReport(webDriver, AXE_BUILDER.analyze(webDriver), destination,
        returnBodyOnly);
  }

  public static void createAxeHtmlViolationsReport(WebDriver webDriver, WebElement element,
      String destination, boolean returnBodyOnly) throws IOException, ParseException {
    createAxeHtmlReport(webDriver, AXE_BUILDER.analyze(webDriver, element), destination, true,
        returnBodyOnly, null, null, null);
  }

  public static void createAxeHtmlViolationsReport(WebDriver webDriver, Results results,
      String destination, boolean returnBodyOnly) throws IOException, ParseException {
    createAxeHtmlReport(webDriver, results, destination, true, returnBodyOnly, null, null, null);
  }

  public static void createAxeHtmlReport(WebDriver webDriver, WebElement element,
      String destination, boolean returnBodyOnly) throws IOException, ParseException {
    createAxeHtmlReport(webDriver, AXE_BUILDER.analyze(webDriver, element), destination, false,
        returnBodyOnly, null, null, null);
  }

  public static void createAxeHtmlReport(WebDriver webDriver, String destination,
      boolean returnBodyOnly) throws IOException, ParseException {
    createAxeHtmlReport(webDriver, AXE_BUILDER.analyze(webDriver), destination, returnBodyOnly);
  }

  public static void createAxeHtmlReport(WebDriver webDriver, Results results, String destination,
      boolean returnBodyOnly) throws IOException, ParseException {
    createAxeHtmlReport(webDriver, results, destination, false, returnBodyOnly, null, null, null);
  }

  public static void createAxeHtmlReport(WebDriver webDriver, String destination,
      boolean writeOnlyViolations, boolean returnBodyOnly, List<String> targetStandards)
      throws IOException, ParseException {
    createAxeHtmlReport(webDriver, AXE_BUILDER.analyze(webDriver), destination, writeOnlyViolations,
        returnBodyOnly, targetStandards, null, null);
  }

  /**
   * Creates the AXE HTML report.
   *
   */
  public static String createAxeHtmlReport(WebDriver webDriver, String destination,
      boolean writeOnlyViolations, boolean returnBodyOnly, List<String> targetStandards,
      List<String> targetExclusions, List<String> cssExclusions)
      throws IOException, ParseException {
    if (targetStandards != null && !targetStandards.contains("")) {
      AXE_BUILDER.withTags(targetStandards);
    }

    // Exclude the below rules and css elements
    if (targetExclusions != null && !targetExclusions.contains("")) {
      AXE_BUILDER.disableRules(targetExclusions);
    }

    if (cssExclusions != null && !cssExclusions.contains("")) {
      for (String exclusion : cssExclusions) {
        AXE_BUILDER.exclude(exclusion);
      }
    }

    return createAxeHtmlReport(webDriver, AXE_BUILDER.analyze(webDriver), destination,
        writeOnlyViolations, returnBodyOnly, targetStandards, targetExclusions, cssExclusions);
  }

  /**
   * Creates the AXE HTML report.
   *
   */
  public static String createAxeHtmlReport(SearchContext context, Results results,
      String destination, boolean writeOnlyViolations, boolean returnBodyOnly,
      List<String> targetStandards, List<String> targetExclusions, List<String> cssExclusions)
      throws IOException, ParseException {
    // Get the unwrapped element if we are using a wrapped element
    context =
        (context instanceof WrapsElement) ? ((WrapsElement) context).getWrappedElement() : context;
    HashSet<String> selectors = new HashSet<>();

    final int violationCount = getCount(results.getViolations(), selectors);
    final int incompleteCount = getCount(results.getIncomplete(), selectors);
    final int passCount = getCount(results.getPasses(), selectors);
    final int inapplicableCount = getCount(results.getInapplicable(), selectors);

    String stringBuilder = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">" + "<head>"
        + "<meta charset=\"utf-8\"><title>Accessibility Check</title><style></style>" + "</head>"
        + "<body></body>" + "</html>";
    Document doc = Jsoup.parse(stringBuilder);
    Element body = doc.body();
    String content = "border: 1px solid black;margin-left:1em;" + "} p {}"
        + ".wrap .wrapTwo .wrapThree{margin:2px;max-width:70vw;}"
        + ".wrapOne {margin-left:1em;overflow-wrap:anywhere;}"
        + ".wrapTwo {margin-left:2em;overflow-wrap:anywhere;}"
        + ".wrapThree {margin-left:3em;overflow-wrap:anywhere;}"
        + ".emOne {margin-left:1em;overflow-wrap:anywhere;}"
        + ".emTwo {margin-left:2em;overflow-wrap:anywhere;}"
        + ".emThree {margin-left:3em;overflow-wrap:anywhere;}"
        + ".majorSection{border: 1px solid black;}" + ".findings{border-top:1px solid black;}"
        + ".htmlTable{border-top:double lightgray;width:100%;display:table;}";
    doc.select("style").append(content);
    Element element = new Element(Tag.valueOf("h1"), "");
    element.appendText("Accessibility Check");
    body.appendChild(element);
    element = new Element(Tag.valueOf("h3"), "");
    element.text("Context");
    body.appendChild(element);
    element = new Element(Tag.valueOf("div"), "");
    element.attributes().put("style", "margin-left:1em;overflow-wrap:anywhere;");
    element.attributes().put("id", "reportContext");
    element.text("Url: " + results.getUrl());
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    element.appendText("Orientation: " + results.getTestEnvironment().getOrientationType());
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    element.appendText("Size: " + results.getTestEnvironment().getwindowWidth() + " x  "
        + results.getTestEnvironment().getWindowHeight());
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    element.appendText("Time: " + getDateFormat(results.getTimestamp()));
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    element.appendText("User agent: " + results.getTestEnvironment().getUserAgent());
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    element.appendText("Using: " + results.getTestEngine().getName() + " ("
        + results.getTestEngine().getVersion() + ")");
    body.appendChild(element);
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    if (targetStandards != null && !targetStandards.isEmpty()) {
      element.appendText("Rules included: " + targetStandards.toString());
    } else {
      element.appendText("Rules included: none");
    }
    body.appendChild(element);
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    if (targetExclusions != null && !targetExclusions.isEmpty()) {
      element.appendText("Rules excluded: " + targetExclusions.toString());
    } else {
      element.appendText("Rules excluded: none");
    }
    body.appendChild(element);
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    if (cssExclusions != null && !cssExclusions.isEmpty()) {
      element.appendText("CSS excluded: " + cssExclusions.toString());
    } else {
      element.appendText("CSS excluded: none");
    }
    body.appendChild(element);
    element = new Element(Tag.valueOf("h3"), "");
    element.appendText("Counts:");
    body.appendChild(element);
    element = new Element(Tag.valueOf("div"), "");
    element.attr("style", "margin-left:1em;overflow-wrap:anywhere;");
    element.text(" Violations: " + violationCount);
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    element.appendText(" Incomplete: " + incompleteCount);
    element.appendChild(new Element(Tag.valueOf("br"), ""));
    if (!writeOnlyViolations) {
      element.appendText(" Pass: " + passCount);
      element.appendChild(new Element(Tag.valueOf("br"), ""));
      element.appendText(" Inapplicable: " + inapplicableCount);
    }
    body.appendChild(element);
    if (results.isErrored()) {
      element = new Element(Tag.valueOf("h2"), "");
      element.appendText("SCAN ERRORS:");
      body.appendChild(element);
      Element error = new Element(Tag.valueOf("div"), "");
      error.attributes().put("id", "ErrorMessage");
      error.appendText(StringEscapeUtils.escapeHtml4(results.getErrorMessage()));
      body.appendChild(error);
    }
    body.appendChild(new Element(Tag.valueOf("br"), ""));
    body.appendChild(new Element(Tag.valueOf("br"), ""));
    Element area = new Element(Tag.valueOf("div"), "");
    if (violationCount > 0) {
      area.appendChild(new Element(Tag.valueOf("br"), ""));
      area.appendChild(getReadableAxeResults(results.getViolations(), ResultType.Violations));
    }
    if (incompleteCount > 0) {
      area.appendChild(new Element(Tag.valueOf("br"), ""));
      area.appendChild(getReadableAxeResults(results.getIncomplete(), ResultType.Incomplete));
    }
    if (passCount > 0 && !writeOnlyViolations) {
      area.appendChild(new Element(Tag.valueOf("br"), ""));
      area.appendChild(getReadableAxeResults(results.getPasses(), ResultType.Passes));
    }
    if (inapplicableCount > 0 && !writeOnlyViolations) {
      area.appendChild(new Element(Tag.valueOf("br"), ""));
      area.appendChild(getReadableAxeResults(results.getInapplicable(), ResultType.Inapplicable));
    }
    body.appendChild(area);
    if (!returnBodyOnly) {
      FileUtils.writeStringToFile(new File(destination), doc.outerHtml(), StandardCharsets.UTF_8);
    }
    return doc.body().outerHtml();
  }

  private static Element getReadableAxeResults(List<Rule> results, ResultType type) {
    Element section = new Element(Tag.valueOf("div"), "");
    section.attr("style", "border: 1px solid black;");
    section.attr("id", type + "Section");
    Element childEl = new Element(Tag.valueOf("h2"), "");
    childEl.text(type.name());
    section.appendChild(childEl);
    int loops = 1;
    for (Rule element : results) {
      childEl = new Element(Tag.valueOf("div"), "");
      childEl.attr("style", "border-top:1px solid black;");
      // childEl.appendText(loops++ + ": " +
      // StringEscapeUtils.escapeHtml4(StringEscapeUtils.unescapeHtml4(element.getHelp())));
      childEl.appendText(loops++ + ": " + element.getHelp());
      section.appendChild(childEl);
      Element childEl2 = new Element(Tag.valueOf("div"), "");
      childEl2.attr("style", "margin-left:2em;overflow-wrap:anywhere;");
      childEl2.text("Description: " + StringEscapeUtils.escapeHtml4(element.getDescription()));
      childEl2.appendChild(new Element(Tag.valueOf("br"), ""));
      childEl2.appendText("Help: " + StringEscapeUtils.escapeHtml4(element.getHelp()));
      childEl2.appendChild(new Element(Tag.valueOf("br"), ""));
      childEl2.appendText("Help URL: ");
      Element link = new Element(Tag.valueOf("a"), "");
      link.attr("href", element.getHelpUrl());
      link.text(element.getHelpUrl());
      childEl2.appendChild(link);
      childEl2.appendChild(new Element(Tag.valueOf("br"), ""));
      if (!element.getImpact().isEmpty()) {
        childEl2.appendText("Impact: " + StringEscapeUtils.escapeHtml4(element.getImpact()));
        childEl2.appendChild(new Element(Tag.valueOf("br"), ""));
      }
      childEl2.appendText("Tags:")
          .append(StringEscapeUtils.escapeHtml4(String.join(", ", element.getTags())));
      childEl2.appendChild(new Element(Tag.valueOf("br"), ""));
      if (!element.getNodes().isEmpty()) {
        childEl2.appendText("Element(s):");
        childEl2.appendChild(new Element(Tag.valueOf("br"), ""));
      }
      childEl.appendChild(childEl2);
      for (CheckedNode item : element.getNodes()) {
        Element elementNodes = new Element(Tag.valueOf("div"), "");
        elementNodes.attr("style", "border-top:double lightgray;width:100%;display:table;");
        childEl.appendChild(elementNodes);
        Element htmlAndSelectorWrapper = new Element(Tag.valueOf("div"), "");
        htmlAndSelectorWrapper.attr("style", "margin-left:3em;overflow-wrap:anywhere;");
        htmlAndSelectorWrapper.text("Html:");
        htmlAndSelectorWrapper.appendChild(new Element(Tag.valueOf("br"), ""));
        elementNodes.appendChild(htmlAndSelectorWrapper);
        Element htmlAndSelector = new Element(Tag.valueOf("p"), "");
        htmlAndSelector.attr("style", "margin-left:1em;overflow-wrap:anywhere;");
        htmlAndSelector.html(item.getHtml());
        htmlAndSelector.text(item.getHtml());
        htmlAndSelectorWrapper.appendChild(htmlAndSelector);
        htmlAndSelectorWrapper.appendText("Selector(s):");
        htmlAndSelector = new Element(Tag.valueOf("p"), "");
        htmlAndSelector.attr("style", "margin-left:2em;overflow-wrap:anywhere;");
        for (Object target : Collections.singletonList(item.getTarget())) {
          String targetString = target.toString().replace("[", "").replace("]", "");
          htmlAndSelector.html(StringEscapeUtils.escapeHtml4(targetString));
          htmlAndSelector.html(targetString);
        }
        htmlAndSelectorWrapper.appendChild(htmlAndSelector);
        addFixes(item, type, htmlAndSelectorWrapper);
      }
    }
    return section;
  }

  /*
   * This method counts the number of issues/results
   */
  private static int getCount(List<Rule> results, HashSet<String> uniqueList) {
    int count = 0;
    for (Rule item : results) {
      for (Node node : item.getNodes()) {
        for (Object target : Collections.singletonList(node.getTarget())) {
          count++;
          uniqueList.add(target.toString());
        }
      }
      // Still add one if no targets are included
      if (item.getNodes().isEmpty()) {
        count++;
      }
    }
    return count;
  }

  /*
   * This method formats the date string
   */
  private static String getDateFormat(String timestamp) throws ParseException {
    Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(timestamp);
    return new SimpleDateFormat("dd-MMM-yy HH:mm:ss Z").format(date);
  }

  /*
   * This method generates the fix any and fix all issues section
   */
  private static void addFixes(CheckedNode resultsNode, ResultType type,
      Element htmlAndSelectorWrapper) {
    List<Check> anyCheckResults = resultsNode.getAny();
    List<Check> allCheckResults = resultsNode.getAll();
    List<Check> noneCheckResults = resultsNode.getNone();
    int checkResultsCount =
        anyCheckResults.size() + allCheckResults.size() + noneCheckResults.size();
    // Add fixes if this is for violations
    if (ResultType.Violations.equals(type) && checkResultsCount > 0) {
      Element htmlAndSelector = new Element(Tag.valueOf("div"), "");
      htmlAndSelector.appendText("To solve:");
      htmlAndSelectorWrapper.appendChild(htmlAndSelector);
      htmlAndSelector = new Element(Tag.valueOf("p"), "");
      htmlAndSelector.attr("style", "margin-left:2em;overflow-wrap:anywhere;");
      htmlAndSelectorWrapper.appendChild(htmlAndSelector);
      if (allCheckResults.size() > 0 || noneCheckResults.size() > 0) {
        fixAllIssues(resultsNode, htmlAndSelectorWrapper, allCheckResults, noneCheckResults);
      }
      if (anyCheckResults.size() > 0) {
        fixAnyIssues(resultsNode, htmlAndSelectorWrapper, anyCheckResults);
      }
    }
  }

  /*
   * This method generates the fix all issues section
   */
  private static void fixAllIssues(CheckedNode doc, Element htmlAndSelectorWrapper,
      List<Check> allCheckResults, List<Check> noneCheckResults) {
    Element htmlAndSelector;
    htmlAndSelector = new Element(Tag.valueOf("p"), "");
    htmlAndSelector.attr("style", "margin-left:1em;overflow-wrap:anywhere;");
    StringBuilder content = new StringBuilder();
    content.append(StringEscapeUtils.escapeHtml4(doc.getFailureSummary()));
    content.append("<ul>");
    for (Check checkResult : allCheckResults) {
      content.append("<li>" + checkResult.getImpact().toUpperCase() + ": "
          + StringEscapeUtils.escapeHtml4(checkResult.getMessage()) + "</li>");
    }
    for (Check checkResult : noneCheckResults) {
      content.append("<li>" + checkResult.getImpact().toUpperCase() + ": "
          + StringEscapeUtils.escapeHtml4(checkResult.getMessage()) + "</li>");
    }
    content.append("</ul>");
    htmlAndSelector.append(content.toString());
    htmlAndSelectorWrapper.appendChild(htmlAndSelector);
  }

  /*
   * This method generates the fix any issues section
   */
  private static void fixAnyIssues(CheckedNode doc, Element htmlAndSelectorWrapper,
      List<Check> anyCheckResults) {
    StringBuilder content = new StringBuilder();
    Element htmlAndSelector = new Element(Tag.valueOf("p"), "");
    htmlAndSelector.attr("style", "margin-left:1em;overflow-wrap:anywhere;");
    content.append(StringEscapeUtils.escapeHtml4(doc.getFailureSummary()));
    content.append("<ul>");
    for (Check checkResult : anyCheckResults) {
      content.append("<li>" + checkResult.getImpact().toUpperCase() + ": "
          + StringEscapeUtils.escapeHtml4(checkResult.getMessage()) + "</li>");
    }
    content.append("</ul>");
    htmlAndSelector.append(content.toString());
    htmlAndSelectorWrapper.appendChild(htmlAndSelector);
  }
}
