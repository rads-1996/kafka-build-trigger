package org.jenkinsci.plugins.kafkabuildtrigger;

import hudson.model.Cause;
import org.kohsuke.stapler.export.Exported;

/**
 * Cause class for remote build.
 */
 public class RemoteBuildCause extends Cause {

    private final String queueName;

    /**
     * Creates instance with specified parameter.
     *
     * @param queueName
     *            the queue name.
     */
    public RemoteBuildCause(String queueName) {
        this.queueName = queueName;
    }

    @Override
    @Exported(visibility = 3)
    public String getShortDescription() {
        return "Triggered by remote build message from Kafka queue: " + queueName;
    }

}