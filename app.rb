#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")

class Message
	include DataMapper::Resource
	property :id, Serial
	property :name, Text, :required => true
	property :message, Text, :required => true
	property :created_at, DateTime
	property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!

get '/' do
	@messages = Message.all :order => :id.desc
	@title = 'A Guestbook'
	erb :home
end

post '/' do
	m = Message.new
	m.name = params[:name]
	m.message = params[:message]
	m.save

	redirect '/'
end