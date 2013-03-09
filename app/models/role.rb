# encoding: utf-8
class Role < ActiveRecord::Base
  attr_accessible :description, :name

  validates_presence_of :name, message: 'Поле не може бути порожнім!'
  validates_uniqueness_of :name, message: 'Назва прав доступу повинна бути унікальною!'
end
