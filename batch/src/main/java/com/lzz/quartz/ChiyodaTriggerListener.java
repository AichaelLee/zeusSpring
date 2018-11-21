package com.lzz.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.Trigger;
import org.quartz.listeners.TriggerListenerSupport;

/**
 * @author wanghaoqi
 */
public class ChiyodaTriggerListener extends TriggerListenerSupport {

    private String name;

    public ChiyodaTriggerListener(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void triggerMisfired(Trigger trigger) {
        this.getLog().info("MISFIRE!!!! {}", String.valueOf(trigger.getPreviousFireTime()));
    }
}
