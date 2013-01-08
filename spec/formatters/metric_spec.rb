require 'spec_helper'
describe Height::Formatters::Metric do
  describe '#format' do
    context 'without I18n' do
      it 'formats' do
        units.each do |unit|
          Height::Formatters::Metric.new(unit).format.should == '1m 91cm'
        end
      end
    end

    context 'with I18n' do
      before do
        I18n.backend.store_translations :en,
          height: {
            format: {
              metric: {
                default: '%{meters}meters %{centimeters}centimeters',
                only_meters: '%{only_meters} meters',
                only_centimeters: '%{only_centimeters} centimeters'
              }
            }
          }
      end

      after do
        reset_i18n
      end

      it 'formats' do
        units.each do |unit|
          formatter = Height::Formatters::Metric.new(unit)
          formatter.format.should == '1meters 91centimeters'
          formatter.format(:only_meters).should == '1.91 meters'
          formatter.format(:only_centimeters).should == '191 centimeters'
        end
      end
    end
  end
end