#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'data_mapper'

get '/' do
	@siteTitle = 'The Guestbook'
	@message = 'Hello, is it me you´re looking for?'
	erb :home
end