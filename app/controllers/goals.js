'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Goal = models.goal

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Goal.find()
    .then(goals => res.json({
      goals: goals.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    goal: req.goal.toJSON({ virtuals: true, user: req.user })
  })
}

const create = (req, res, next) => {
  const goal = Object.assign(req.body.goal, {
    _owner: req.user._id
  })
  Goal.create(goal)
    .then(goal =>
      res.status(201)
        .json({
          goal: goal.toJSON({ virtuals: true, user: req.user })
        }))
    .catch(next)
}

const update = (req, res, next) => {
  delete req.body._owner  // disallow owner reassignment.
  req.goal.update(req.body.goal)
    .then(() => res.sendStatus(204))
    .catch(next)
}

const destroy = (req, res, next) => {
  req.goal.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate },
  { method: setModel(Goal), only: ['show'] },
  { method: setModel(Goal, { forUser: true }), only: ['update', 'destroy'] }
] })
