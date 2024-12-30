package com.qea.racv.repo;

/**
 * Result object used to get the pass/fail status with any feedback messages.
 * 
 */
public class Result {
  private boolean pass;
  private String message;

  /**
   * Result object used to get the pass/fail status with any feedback messages.
   *
   * @param pass true if passed
   * @param message the message to set
   */
  public Result(boolean pass, String message) {
    this.pass = pass;
    this.message = message;
  }

  /**
   * Result object used to get the pass/fail status with any feedback messages.
   *
   */
  public Result() {
    this.pass = false;
    this.message = "";
  }

  /**
   * Get the status of the result.
   *
   * @return true if passed
   */
  public boolean pass() {
    return pass;
  }

  /**
   * Set the status of the result.
   *
   * @param status true if pass
   */
  public void setStatus(boolean status) {
    this.pass = status;
  }

  /**
   * Get the associated messages with the result object.
   *
   * @return the message
   */
  public String message() {
    return message;
  }

  /**
   * Set the associated messages with the result object.
   *
   * @param message the message to set
   */
  public void setMessage(String message) {
    this.message = message;
  }
}
