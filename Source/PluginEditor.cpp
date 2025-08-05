#include "PluginProcessor.h"
#include "PluginEditor.h"

GainPluginAudioProcessorEditor::GainPluginAudioProcessorEditor(GainPluginAudioProcessor& p)
    : AudioProcessorEditor(&p), audioProcessor(p)
{
    gainSlider.setSliderStyle(juce::Slider::LinearHorizontal);
    gainSlider.setRange(0.0, 1.0);
    gainSlider.setValue(audioProcessor.getGain());
    gainSlider.setTextBoxStyle(juce::Slider::TextBoxRight, false, 80, 20);
    addAndMakeVisible(gainSlider);

    gainSlider.onValueChange = [this] {
        audioProcessor.setGain((float)gainSlider.getValue());
    };
    
    setSize(400, 150);
}

GainPluginAudioProcessorEditor::~GainPluginAudioProcessorEditor() {}

void GainPluginAudioProcessorEditor::paint(juce::Graphics& g) {
    g.fillAll(getLookAndFeel().findColour(juce::ResizableWindow::backgroundColourId));
    g.setColour(juce::Colours::white);
    g.setFont(15.0f);
    g.drawFittedText("Gain Control", getLocalBounds(), juce::Justification::centredTop, 1);
}

void GainPluginAudioProcessorEditor::resized() {
    gainSlider.setBounds(40, 50, getWidth() - 80, 30);
}
