"use strict";

import * as inflection from 'inflection';

export const pluralize= function pluralizeImpl (x) {
  return inflection.pluralize(x);
};

export const singularize = function singularizeImpl (x) {
  return inflection.singularize(x);
};

export const camelizeImpl = function (x, l) {
  return inflection.camelize(x,l);
}

export const underscore = function underscoreImpl (x) {
  return inflection.underscore(x);
};

export const humanizeImpl = function(x, l) {
  return inflection.humanize(x,l);
}

export const capitalize =  (x) =>inflection.capitalize(x);

export const titleize = function titleizeImpl (x) {
  return inflection.titleize(x);
};

export const tableize = function tableizeImpl (x) {
  return inflection.tableize(x);
};

export const classify = function classifyImpl (x) {
  return inflection.classify(x);
};

export const foreignKey = function foreignKeyImpl (x) {
  return inflection.foreign_key(x);
};

export const ordinalize = function ordinalizeImpl (x) {
  return inflection.ordinalize(x);
};