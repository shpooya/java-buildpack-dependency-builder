# Encoding: utf-8
# Copyright (c) 2013 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'
require 'build/dependency/dependency_helper'
require 'build/dependency/base_mmm'

describe Build::Dependency::BaseMMM do
  include_context 'dependency_helper'

  let(:dependency) { described_class.new('test-name', 'test-type', options) }

  it 'should create MMM URI' do
    expect(dependency).to receive(:mmm_specific).and_return(->(_v) { 'test-uri' })

    expect_version_uri '3.5.1', 'test-uri'
  end

  it 'should fail if mmm_specific is not implemented' do
    expect { dependency.send :mmm_specific }.to raise_error("Method 'mmm_specific' must be defined")
  end

end