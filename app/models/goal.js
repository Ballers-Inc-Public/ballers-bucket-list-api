'use strict'

const mongoose = require('mongoose')

const goalSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  status: {
    type: String,
    enum: ['Finished', 'Not Started'],
    required: true
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
})

goalSchema.virtual('length').get(function length () {
  return this.title.length
})

const Goal = mongoose.model('Goal', goalSchema)

module.exports = Goal
