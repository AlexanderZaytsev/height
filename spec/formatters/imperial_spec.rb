require 'spec_helper'
describe Height::Formatters::Imperial do
  describe '#format' do

    context 'without I18n' do
      it 'formats' do
        units.each do |unit|
          Height::Formatters::Imperial.new(unit).format.should == "6 ft 3 in"
        end
      end
    end

    context 'with I18n' do
      before do
        ::I18n.backend.store_translations :en,
          height: {
            format: {
              imperial: {
                default: '%{feet}\' %{inches}"'
              }
            }
          }
      end

      after do
        reset_i18n
      end

      it 'uses i18n formats' do
        units.each do |unit|
          Height::Formatters::Imperial.new(unit).format.should == '6\' 3"'
        end
      end

    end
  end
end