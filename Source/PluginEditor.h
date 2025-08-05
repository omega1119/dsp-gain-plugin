// PluginEditor.h
#pragma once
#include <JuceHeader.h>
#include "PluginProcessor.h"

class GainPluginAudioProcessorEditor : public juce::AudioProcessorEditor {
public:
    GainPluginAudioProcessorEditor(GainPluginAudioProcessor&);
    ~GainPluginAudioProcessorEditor() override;

    void paint(juce::Graphics&) override;
    void resized() override;

private:
    GainPluginAudioProcessor& audioProcessor;
    juce::Slider gainSlider;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(GainPluginAudioProcessorEditor)
};
