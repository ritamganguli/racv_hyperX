package com.qea.racv.utils;

import com.qea.racv.repo.Global;
import org.apache.logging.log4j.core.LogEvent;
import org.apache.logging.log4j.core.config.plugins.Plugin;
import org.apache.logging.log4j.core.lookup.StrLookup;

/**
 * This class is required to rename the log files.
 */
@Plugin(name = "logDir", category = StrLookup.CATEGORY)
public class LogDirLookup implements StrLookup {

  @Override
  public String lookup(String key) {
    return Global.getRunTime();
  }

  @Override
  public String lookup(LogEvent event, String key) {
    return Global.getRunTime();
  }
}
