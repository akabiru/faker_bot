# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Faker::Bot::Reflectors::List do
  describe '#call' do
    context 'when show methods is enabled' do
      it 'returns all descendants and their methods' do
        options = { show_methods: true }

        reflector = described_class.new(options)
        result = reflector.call

        sample_result = result.first
        sample_result_key = sample_result.first.to_s
        sample_result_value = sample_result.last

        expect(result).to be_a(Hash)
        expect(sample_result_key).to match(/Faker::/)
        expect(sample_result_value).to be_a(Array)
        expect(sample_result_value).not_to be_empty
      end

      context 'when passing a filter' do
        context 'when filtering by full class name' do
          it 'returns filtered descendants and their methods' do
            options = { show_methods: true, filter: 'Faker::Beer' }

            reflector = described_class.new(options)
            result = reflector.call

            sample_result = result.first
            sample_result_key = sample_result.first.to_s
            sample_result_value = sample_result.last

            expect(result).to be_a(Hash)
            expect(sample_result_key).to eq('Faker::Beer')
            expect(sample_result_value).to be_a(Array)
            expect(sample_result_value).not_to be_empty
          end
        end

        context 'when filtering by partial class name' do
          it 'returns filtered descendants and their methods' do
            options = { show_methods: true, filter: 'Beer' }

            reflector = described_class.new(options)
            result = reflector.call

            sample_result = result.first
            sample_result_key = sample_result.first.to_s
            sample_result_value = sample_result.last

            expect(result).to be_a(Hash)
            expect(sample_result_key).to eq('Faker::Beer')
            expect(sample_result_value).to be_a(Array)
            expect(sample_result_value).not_to be_empty
          end
        end
      end
    end

    context 'when show methods is disabled' do
      it 'returns only the descendants' do
        options = { show_methods: false }

        reflector = described_class.new(options)
        result = reflector.call
        sample_result = result.first.to_s

        expect(result).to be_a(Array)
        expect(result).not_to be_empty
        expect(sample_result).to match(/Faker::/)
      end

      context 'when passing a filter' do
        context 'when filtering by full class name' do
          it 'returns filtered descendants and their methods' do
            options = { show_methods: false, filter: 'Faker::Beer' }

            reflector = described_class.new(options)
            result = reflector.call
            sample_result = result.first.to_s

            expect(result).to be_a(Array)
            expect(result).not_to be_empty
            expect(sample_result).to eq('Faker::Beer')
          end
        end

        context 'when filtering by partial class name' do
          it 'returns filtered descendants and their methods' do
            options = { show_methods: false, filter: 'Beer' }

            reflector = described_class.new(options)
            result = reflector.call
            sample_result = result.first.to_s

            expect(result).to be_a(Array)
            expect(result).not_to be_empty
            expect(sample_result).to eq('Faker::Beer')
          end
        end
      end
    end
  end
end
