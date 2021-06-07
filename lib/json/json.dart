import 'package:flutter/material.dart';

const categories = [
  {"label": 'Apple', "array": randomStore},
  {"label": 'SofaLife', "array": sofaStore},
  {"label": 'Panasonic', "array": tvStore},
  {"label": 'Vt', "array": tvStore},
  {"label": 'Tv', "array": tvStore},
];

const randomStore = [
  {
    "category": "Sapatos",
    "label": "Shoe",
    "price": "\$80.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.lg7ZTSuIPGHwe37sKe_2fAHaHa%26pid%3DApi&f=1",
    "quantity": '8'
  },
  {
    "category": 'Apple',
    "label": "Phone",
    "price": "\$95.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.9DkQxaaJ3geLMtqA-FmYvwHaGW%26pid%3DApi&f=1",
    "quantity": '8'
  },
];

const sofaStore = [
  {
    "category": "Uratex",
    "label": "Nordic Sofa",
    "price": "\$30.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.s3GWpPfjIeycEYmshs1THAHaFb%26pid%3DApi&f=1",
    "quantity": '8'
  },
  {
    "category": "SofaLife",
    "label": "Soft Sofa",
    "price": "\$95.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.CtW80KFOHQVifsBKmBH5SAHaFu%26pid%3DApi&f=1",
    "quantity": '8'
  }
];

const tvStore = [
  {
    "category": "Xiaomi",
    "label": "MTv",
    "price": "\$20.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.SxVUBTeowSt_XoXw83AT_QHaGQ%26pid%3DApi&f=1",
    "quantity": '8'
  },
  {
    "category": "Samsung",
    "label": "WTv",
    "price": "\$55.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.SxVUBTeowSt_XoXw83AT_QHaGQ%26pid%3DApi&f=1",
    "quantity": '8'
  },
  {
    "category": "Panasonic",
    "label": "WTv",
    "price": "\$55.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.SxVUBTeowSt_XoXw83AT_QHaGQ%26pid%3DApi&f=1",
    "quantity": '8'
  },
  {
    "category": "TV",
    "label": "WTv",
    "price": "\$55.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.SxVUBTeowSt_XoXw83AT_QHaGQ%26pid%3DApi&f=1",
    "quantity": '8'
  },
  {
    "category": "Bose",
    "label": "WTv",
    "price": "\$55.00",
    "image":
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.SxVUBTeowSt_XoXw83AT_QHaGQ%26pid%3DApi&f=1",
    "quantity": '8'
  },
];
