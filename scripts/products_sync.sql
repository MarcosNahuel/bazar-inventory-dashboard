-- Productos sincronizados desde ML
-- Generado: 2026-02-06T01:30:09.496Z

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288539476', 'TBWT00523', 'Soporte De Coche Para Smartphone Tipo Garra Con Ventosa', 6590, 0, 'closed', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288539476-soporte-de-coche-para-smartphone-tipo-garra-con-ventosa-_JM', 'http://http2.mlstatic.com/D_999540-MLA93374187916_092025-I.jpg', 'MLC58500', '2025-10-30T21:40:22.170Z'::timestamptz, '2025-12-17T22:55:16.261Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2933761312', 'ARDM07634', 'Basurero Metálico Con Pedal 8 Litros Pedal Acabado Madera Marrón', 19980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2933761312-basurero-metalico-con-pedal-8-litros-pedal-acabado-madera-marron-_JM', 'http://http2.mlstatic.com/D_703738-MLC82892117701_032025-I.jpg', 'MLC436131', '2025-06-23T16:54:59.516Z'::timestamptz, '2026-01-21T16:51:34.155Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3092101060', 'MQOQ98434', 'Pack 6 Piso Deportivo Modular Goma Eva 60x60x1 Cm Fitness Blanco Blanco Industrial', 11890, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3092101060-pack-6-piso-deportivo-modular-goma-eva-60x60x1-cm-fitness-blanco-blanco-industrial-_JM', 'http://http2.mlstatic.com/D_825206-MLC90819772977_082025-I.jpg', 'MLC439869', '2025-08-26T02:53:16.703Z'::timestamptz, '2026-01-21T16:44:21.288Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2853724594', NULL, 'Espejo Para Maquillaje Espejo Doble De Mesa Con Aumento 36cm', 30430, 1, 'closed', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2853724594-espejo-para-maquillaje-espejo-doble-de-mesa-con-aumento-36cm-_JM', 'http://http2.mlstatic.com/D_829653-MLC82628375404_032025-I.jpg', 'MLC431591', '2025-03-06T15:42:18.475Z'::timestamptz, '2026-02-02T21:54:01.690Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1583346817', NULL, 'Pack 6 Piso Deportivo Modular Goma Eva 60x60x1 Cm Fitness', 11990, 0, 'closed', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1583346817-pack-6-piso-deportivo-modular-goma-eva-60x60x1-cm-fitness-_JM', 'http://http2.mlstatic.com/D_825206-MLC90819772977_082025-I.jpg', 'MLC439869', '2025-03-05T23:15:45.515Z'::timestamptz, '2025-12-14T20:06:49.340Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3092101058', 'NQVE96229', 'Pack 6 Piso Deportivo Modular Goma Eva 60x60x1 Cm Fitness Negro Negro Industrial', 11890, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3092101058-pack-6-piso-deportivo-modular-goma-eva-60x60x1-cm-fitness-negro-negro-industrial-_JM', 'http://http2.mlstatic.com/D_850768-MLC89824088737_082025-I.jpg', 'MLC439869', '2025-08-26T02:53:16.702Z'::timestamptz, '2026-01-21T16:34:14.185Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2933761314', 'UPUH08398', 'Basurero Metálico Con Pedal 8 Litros Pedal Acabado Madera Gris', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2933761314-basurero-metalico-con-pedal-8-litros-pedal-acabado-madera-gris-_JM', 'http://http2.mlstatic.com/D_639866-MLC82891882155_032025-I.jpg', 'MLC436131', '2025-06-23T16:54:59.520Z'::timestamptz, '2026-01-21T16:44:31.522Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1582589593', NULL, 'Fuente Pileta Cascada De Agua Jesus Grande 39 Cm Con Luz Gris', 53831, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1582589593-fuente-pileta-cascada-de-agua-jesus-grande-39-cm-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_786802-MLC82842326393_032025-I.jpg', 'MLC412687', '2025-03-03T23:07:19.645Z'::timestamptz, '2026-01-21T16:44:24.245Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2853290088', 'ZVRX97711', 'Pack 24 Burbujas Juguete Sorpresa Cumpleaños Regalo Paseo Multicolor', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2853290088-pack-24-burbujas-juguete-sorpresa-cumpleanos-regalo-paseo-multicolor-_JM', 'http://http2.mlstatic.com/D_953798-MLC83007708995_032025-I.jpg', 'MLC388313', '2025-03-05T15:48:47.495Z'::timestamptz, '2026-01-21T16:49:08.312Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1582563757', NULL, 'Fuente Pileta Cascada De Agua Querubín Con Luz Grande 28cm Gris', 35700, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1582563757-fuente-pileta-cascada-de-agua-querubin-con-luz-grande-28cm-gris-_JM', 'http://http2.mlstatic.com/D_868438-MLC82842325041_032025-I.jpg', 'MLC412687', '2025-03-03T22:56:53.908Z'::timestamptz, '2026-01-21T16:44:30.563Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1582511883', NULL, 'Pack 6 Platos Hondos Floreado Opal Templado 22cm Blanco Floreado', 30754, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1582511883-pack-6-platos-hondos-floreado-opal-templado-22cm-blanco-floreado-_JM', 'http://http2.mlstatic.com/D_713543-MLC82841909073_032025-I.jpg', 'MLC159292', '2025-03-03T22:14:50.838Z'::timestamptz, '2026-01-28T16:48:30.891Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1582563657', NULL, 'Pack 4 Vasos Con Bombilla Y Tapa 600 Ml Vidrio Shopero 600ml Multicolor', 15354, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1582563657-pack-4-vasos-con-bombilla-y-tapa-600-ml-vidrio-shopero-600ml-multicolor-_JM', 'http://http2.mlstatic.com/D_987451-MLC82841911115_032025-I.jpg', 'MLC159271', '2025-03-03T22:22:01.326Z'::timestamptz, '2026-01-21T16:44:22.481Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1582663459', NULL, 'Organizador Verdulero Frutero 3 Niveles Metálico Inoxidable Plateado', 25700, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1582663459-organizador-verdulero-frutero-3-niveles-metalico-inoxidable-plateado-_JM', 'http://http2.mlstatic.com/D_813988-MLC82841873385_032025-I.jpg', 'MLC413429', '2025-03-03T22:27:31.254Z'::timestamptz, '2026-01-21T16:34:20.550Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2853171858', 'AS-1', 'Set 10 30x30 Alfombra Infantil Goma Eva Cuadros Bebes Niños', 4782, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2853171858-set-10-30x30-alfombra-infantil-goma-eva-cuadros-bebes-ninos-_JM', 'http://http2.mlstatic.com/D_977280-MLC82884303791_032025-I.jpg', 'MLC439869', '2025-03-05T11:53:20.012Z'::timestamptz, '2026-01-26T00:36:38.555Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1604270301', 'SZGU09152', 'Organizador Y Separador De Cubiertos', 8557, 0, 'closed', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1604270301-organizador-y-separador-de-cubiertos-_JM', 'http://http2.mlstatic.com/D_819422-MLU76844316046_062024-I.jpg', 'MLC436420', '2025-04-27T21:04:02.899Z'::timestamptz, '2025-12-16T22:14:11.484Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2863704914', 'RCUM08708', 'Pack 4 Goma Eva Piso Alfombra Antigolpes 60x60x1cm Madera Marrón Piso Flotante', 15354, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2863704914-pack-4-goma-eva-piso-alfombra-antigolpes-60x60x1cm-madera-marron-piso-flotante-_JM', 'http://http2.mlstatic.com/D_611274-MLC82602728526_032025-I.jpg', 'MLC439869', '2025-04-03T13:47:02.533Z'::timestamptz, '2026-01-21T16:34:28.240Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2863704912', 'CMPF96621', 'Pack 4 Goma Eva Piso Alfombra Antigolpes 60x60x1cm Madera Beige Lisa', 9618, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2863704912-pack-4-goma-eva-piso-alfombra-antigolpes-60x60x1cm-madera-beige-lisa-_JM', 'http://http2.mlstatic.com/D_727085-MLC82816781176_032025-I.jpg', 'MLC439869', '2025-04-03T13:47:02.527Z'::timestamptz, '2026-01-21T16:49:08.561Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1583375395', 'ZTHJ08765', 'Basurero Metálico Con Pedal 3 Litros Plateado Acero Canasta Gris', 5200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1583375395-basurero-metalico-con-pedal-3-litros-plateado-acero-canasta-gris-_JM', 'http://http2.mlstatic.com/D_654230-MLC82603149634_032025-I.jpg', 'MLC436131', '2025-03-05T17:42:52.295Z'::timestamptz, '2026-01-21T16:44:22.576Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1582676309', NULL, 'Tabla Planchar Tabla De Planchar Metal Y Tela 110 Cm Mangas Al Azar Multicolor', 42843, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1582676309-tabla-planchar-tabla-de-planchar-metal-y-tela-110-cm-mangas-al-azar-multicolor-_JM', 'http://http2.mlstatic.com/D_963268-MLC83111331667_032025-I.jpg', 'MLC174460', '2025-03-03T22:08:03.661Z'::timestamptz, '2026-01-21T16:44:23.197Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2853425396', 'XJEK98531', 'Basurero Metálico Con Pedal 12 Litros Plateado Acero Canasta Gris', 12500, 76, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2853425396-basurero-metalico-con-pedal-12-litros-plateado-acero-canasta-gris-_JM', 'http://http2.mlstatic.com/D_654230-MLC82603149634_032025-I.jpg', 'MLC436131', '2025-03-05T17:17:10.529Z'::timestamptz, '2026-02-05T16:40:12.521Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585111423', NULL, 'Caja 48 Tazones Para Sublimacion Blanco Grado A 11oz Ceramic Blanco', 61320, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1585111423-caja-48-tazones-para-sublimacion-blanco-grado-a-11oz-ceramic-blanco-_JM', 'http://http2.mlstatic.com/D_994894-MLC82727235554_032025-I.jpg', 'MLC32658', '2025-03-11T21:41:49.346Z'::timestamptz, '2026-01-21T16:34:16.396Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855681612', NULL, 'Set Jarra Y 6 Vasos Conjunto Jarra 2 Litros Y 6 Vasos Vidrio Transparente', 24988, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2855681612-set-jarra-y-6-vasos-conjunto-jarra-2-litros-y-6-vasos-vidrio-transparente-_JM', 'http://http2.mlstatic.com/D_735761-MLC82723632782_032025-I.jpg', 'MLC179055', '2025-03-11T18:03:15.740Z'::timestamptz, '2026-01-21T16:34:37.314Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855683304', 'JSPD30748', 'Set 4 Libros Para Colorear Antiestrés 64 Paginas Extraibles', 24988, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2855683304-set-4-libros-para-colorear-antiestres-64-paginas-extraibles-_JM', 'http://http2.mlstatic.com/D_860234-MLC82721220094_032025-I.jpg', 'MLC1196', '2025-03-11T15:35:21.686Z'::timestamptz, '2026-01-26T17:27:41.865Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1583337113', 'QJPY07578', 'Basurero Metálico Con Pedal 8 Litros Plateado Acero Canasta', 10727, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1583337113-basurero-metalico-con-pedal-8-litros-plateado-acero-canasta-_JM', 'http://http2.mlstatic.com/D_654230-MLC82603149634_032025-I.jpg', 'MLC436131', '2025-03-05T16:02:06.679Z'::timestamptz, '2026-01-21T16:44:28.361Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585279683', 'YIZC13254', 'Colgante De Viento Campana De Viento Llamador De Angel 68cm Plateado', 8990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1585279683-colgante-de-viento-campana-de-viento-llamador-de-angel-68cm-plateado-_JM', 'http://http2.mlstatic.com/D_657788-MLC99135813360_112025-I.jpg', 'MLC7175', '2025-03-11T21:52:27.075Z'::timestamptz, '2026-01-21T16:44:19.259Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855521002', 'UPUH08398', 'Basurero Metálico Con Pedal 8 Litros Pedal Acabado Madera Color Gris', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2855521002-basurero-metalico-con-pedal-8-litros-pedal-acabado-madera-color-gris-_JM', 'http://http2.mlstatic.com/D_710239-MLA99883684949_112025-I.jpg', 'MLC436131', '2025-03-11T14:20:32.927Z'::timestamptz, '2026-01-21T16:44:25.755Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3086615010', 'OXPB85517', 'Espejo Para Maquillaje Espejo Doble De Mesa Con Aumento 36cm Rosado', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3086615010-espejo-para-maquillaje-espejo-doble-de-mesa-con-aumento-36cm-rosado-_JM', 'http://http2.mlstatic.com/D_725860-MLC82915186023_032025-I.jpg', 'MLC431591', '2025-08-23T05:57:57.880Z'::timestamptz, '2026-01-21T16:44:15.106Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1583743561', NULL, 'Pileta Y Cascada De Agua Buda Meditación Feng Shui Con Luz Gris', 53320, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1583743561-pileta-y-cascada-de-agua-buda-meditacion-feng-shui-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_802064-MLC82628767378_032025-I.jpg', 'MLC412687', '2025-03-06T18:13:13.266Z'::timestamptz, '2026-01-21T16:44:19.489Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855521136', NULL, 'Pileta Y Cascada De Agua Buda Meditación Feng Shui Con Luz Color Gris', 53320, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2855521136-pileta-y-cascada-de-agua-buda-meditacion-feng-shui-con-luz-color-gris-_JM', 'http://http2.mlstatic.com/D_882765-MLA82666524662_032025-I.jpg', 'MLC412687', '2025-03-11T14:33:49.297Z'::timestamptz, '2026-01-21T16:34:08.994Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855615494', 'NNRO14133', 'Fuente De Agua Pileta De Agua Buda Feng Shui 18 Cm Con Luz Gris', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2855615494-fuente-de-agua-pileta-de-agua-buda-feng-shui-18-cm-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_778798-MLC89160117735_082025-I.jpg', 'MLC412687', '2025-03-11T16:08:28.818Z'::timestamptz, '2026-01-21T16:44:31.392Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855469106', 'ZVRX97711', 'Pack 24 Burbujas - Juguete Sorpresa Cumpleaños Paseo Color Multicolor', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2855469106-pack-24-burbujas-juguete-sorpresa-cumpleanos-paseo-color-multicolor-_JM', 'http://http2.mlstatic.com/D_979065-MLA100086285835_122025-I.jpg', 'MLC388313', '2025-03-11T14:26:05.997Z'::timestamptz, '2026-01-21T16:44:30.338Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585279801', 'SFQB18261', 'Estatua Buda Pileta De Agua Fuente De Agua Buda 28cm Con Luz Gris', 31992, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1585279801-estatua-buda-pileta-de-agua-fuente-de-agua-buda-28cm-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_980469-MLC82727262904_032025-I.jpg', 'MLC412687', '2025-03-11T22:04:51.314Z'::timestamptz, '2026-01-21T16:44:22.799Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585189105', 'UWUX08754', 'Colgante De Viento Campana De Viento Llamador De Angel Turco Plateado', 12843, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1585189105-colgante-de-viento-campana-de-viento-llamador-de-angel-turco-plateado-_JM', 'http://http2.mlstatic.com/D_997885-MLC83014799033_032025-I.jpg', 'MLC7175', '2025-03-11T21:58:34.384Z'::timestamptz, '2026-01-21T16:44:30.054Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2853699866', 'CBQU76899', 'Reloj De Cocina Análogo Grande Dorado Reloj De Pared 60cm Dorado Blanco', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2853699866-reloj-de-cocina-analogo-grande-dorado-reloj-de-pared-60cm-dorado-blanco-_JM', 'http://http2.mlstatic.com/D_933540-MLC82627724152_032025-I.jpg', 'MLC3948', '2025-03-06T15:11:12.540Z'::timestamptz, '2026-01-21T16:34:10.617Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855289622', 'SZGU09152', 'Separador De Servicios Organizador De Servicios O Cubiertos Transparente', 8557, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2855289622-separador-de-servicios-organizador-de-servicios-o-cubiertos-transparente-_JM', 'http://http2.mlstatic.com/D_929123-MLC82721423718_032025-I.jpg', 'MLC436420', '2025-03-11T15:54:20.359Z'::timestamptz, '2026-01-21T16:49:08.014Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3086615012', 'XWEE83736', 'Espejo Para Maquillaje Espejo Doble De Mesa Con Aumento 36cm Blanco', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3086615012-espejo-para-maquillaje-espejo-doble-de-mesa-con-aumento-36cm-blanco-_JM', 'http://http2.mlstatic.com/D_829653-MLC82628375404_032025-I.jpg', 'MLC431591', '2025-08-23T05:57:57.907Z'::timestamptz, '2026-02-02T21:54:01.679Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855651866', 'FZBB98605', '28cm Portacupcake Porta Torta Porta Cupcakes Campana Vidrio Transparente', 11554, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2855651866-28cm-portacupcake-porta-torta-porta-cupcakes-campana-vidrio-transparente-_JM', 'http://http2.mlstatic.com/D_656750-MLC82720591154_032025-I.jpg', 'MLC412621', '2025-03-11T15:06:04.088Z'::timestamptz, '2026-01-21T16:44:24.255Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585173079', NULL, 'Figura Estatua Adorno Caballo Blanco Grande 29 Cm Elegante Blanco', 31238, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1585173079-figura-estatua-adorno-caballo-blanco-grande-29-cm-elegante-blanco-_JM', 'http://http2.mlstatic.com/D_698814-MLC83011827309_032025-I.jpg', 'MLC412687', '2025-03-11T18:46:25.457Z'::timestamptz, '2026-01-21T16:44:31.051Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1584601859', NULL, 'Pack 4 Vasos Con Bombilla Y Tapa Shopero 600 Ml Vidrio Color Multicolor', 15354, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1584601859-pack-4-vasos-con-bombilla-y-tapa-shopero-600-ml-vidrio-color-multicolor-_JM', 'http://http2.mlstatic.com/D_826440-MLA96263701226_102025-I.jpg', 'MLC159271', '2025-03-10T18:38:43.510Z'::timestamptz, '2026-01-21T16:44:26.643Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1583327473', 'VJDW98343', 'Basurero Metálico Con Pedal 20 Litros Plateado Acero Canasta Acero Inox Brillante', 19980, 32, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1583327473-basurero-metalico-con-pedal-20-litros-plateado-acero-canasta-acero-inox-brillante-_JM', 'http://http2.mlstatic.com/D_654230-MLC82603149634_032025-I.jpg', 'MLC436131', '2025-03-05T17:48:07.049Z'::timestamptz, '2026-02-05T17:32:05.582Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1586176079', 'OXCT07901', 'Fuente De Agua Pileta De Agua Elefante Con Luz 18 Cm Gris', 24988, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1586176079-fuente-de-agua-pileta-de-agua-elefante-con-luz-18-cm-gris-_JM', 'http://http2.mlstatic.com/D_965635-MLC82774203676_032025-I.jpg', 'MLC412687', '2025-03-13T22:09:52.544Z'::timestamptz, '2026-01-21T16:44:30.563Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2863379684', 'PFAX97058', 'Set 10 30x30 Alfombra Infantil Goma Eva Cuadros Bebes Niños Color Multicolor Números', 4782, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2863379684-set-10-30x30-alfombra-infantil-goma-eva-cuadros-bebes-ninos-color-multicolor-numeros-_JM', 'http://http2.mlstatic.com/D_813263-MLA82983831835_032025-I.jpg', 'MLC439869', '2025-03-27T22:13:03.704Z'::timestamptz, '2026-01-25T23:12:40.457Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1586344127', 'VWKN76322', 'Fuente De Agua Pileta De Agua Ganesha Con Luz 18 Cm Dorado', 24988, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1586344127-fuente-de-agua-pileta-de-agua-ganesha-con-luz-18-cm-dorado-_JM', 'http://http2.mlstatic.com/D_717180-MLC82774462884_032025-I.jpg', 'MLC32663', '2025-03-13T22:44:27.793Z'::timestamptz, '2026-01-21T16:44:30.347Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1589095741', NULL, 'Set 3 Maletas De Viaje 23, 15, 10 Kg Maleta De Cabina Tela Marrón Marron Elegante', 106653, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1589095741-set-3-maletas-de-viaje-23-15-10-kg-maleta-de-cabina-tela-marron-marron-elegante-_JM', 'http://http2.mlstatic.com/D_822453-MLC83201100795_032025-I.jpg', 'MLC179521', '2025-03-20T14:19:51.596Z'::timestamptz, '2026-01-21T16:44:28.520Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585891979', 'BIDY17950', 'Estatua Figura Religiosa Angel Virgen Maria Familia Sagrada Roble', 17493, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1585891979-estatua-figura-religiosa-angel-virgen-maria-familia-sagrada-roble-_JM', 'http://http2.mlstatic.com/D_661634-MLC91915126320_092025-I.jpg', 'MLC412687', '2025-03-13T12:21:42.283Z'::timestamptz, '2026-01-21T16:34:16.151Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1590145681', 'RTKG09361', 'Basurero Metálico Con Pedal 5 Litros Plateado Acero Canasta', 7000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1590145681-basurero-metalico-con-pedal-5-litros-plateado-acero-canasta-_JM', 'http://http2.mlstatic.com/D_654230-MLC82603149634_032025-I.jpg', 'MLC436131', '2025-03-24T17:53:05.111Z'::timestamptz, '2026-01-21T16:44:20.006Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1586318489', 'VJTK08224', 'Fuente De Agua Pileta De Agua Jesus Sagrado Con Luz 18 Cm Gris', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1586318489-fuente-de-agua-pileta-de-agua-jesus-sagrado-con-luz-18-cm-gris-_JM', 'http://http2.mlstatic.com/D_761505-MLC91914833124_092025-I.jpg', 'MLC412687', '2025-03-13T22:53:20.345Z'::timestamptz, '2026-01-21T16:44:23.139Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1586264401', 'VLXD77294', 'Fuente De Agua Pileta De Agua Elefantes 28 Cm Con Luz Gris', 29400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1586264401-fuente-de-agua-pileta-de-agua-elefantes-28-cm-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_924837-MLC92243137926_092025-I.jpg', 'MLC412687', '2025-03-13T20:25:56.161Z'::timestamptz, '2026-01-21T16:44:25.754Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2856788222', NULL, 'Fuente De Agua Pileta De Agua 3 Vasijas Grande 37 Cm Con Luz Gris', 39990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2856788222-fuente-de-agua-pileta-de-agua-3-vasijas-grande-37-cm-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_934098-MLC83055972703_032025-I.jpg', 'MLC412687', '2025-03-13T15:00:57.256Z'::timestamptz, '2026-01-21T16:44:19.973Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1586204807', 'AMNP88591', 'Fuente De Agua Pileta De Agua Querubín 18cm Con Luz Gris', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1586204807-fuente-de-agua-pileta-de-agua-querubin-18cm-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_925430-MLC90033096415_082025-I.jpg', 'MLC412687', '2025-03-14T00:01:13.558Z'::timestamptz, '2026-01-21T16:44:31.381Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2856205088', 'GCDT96217', 'Estatua Figura Gato Adorno Interior Gata Regalo 30 Cm Blanco', 13990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2856205088-estatua-figura-gato-adorno-interior-gata-regalo-30-cm-blanco-_JM', 'http://http2.mlstatic.com/D_841288-MLC83032249555_032025-I.jpg', 'MLC412687', '2025-03-12T15:51:57.484Z'::timestamptz, '2026-01-21T16:44:29.899Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585098747', NULL, 'Estatua Decorativa Pileta De Agua Fuente De Agua Grande 40cm Gris', 59987, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1585098747-estatua-decorativa-pileta-de-agua-fuente-de-agua-grande-40cm-gris-_JM', 'http://http2.mlstatic.com/D_879301-MLC82727672138_032025-I.jpg', 'MLC412687', '2025-03-11T22:42:19.861Z'::timestamptz, '2026-01-21T16:44:25.042Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1590158569', 'SZAU97949', 'Fuente De Agua Pileta De Agua Virgen Maria Con Luz 18 Cm Gris', 24988, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1590158569-fuente-de-agua-pileta-de-agua-virgen-maria-con-luz-18-cm-gris-_JM', 'http://http2.mlstatic.com/D_980962-MLC92661211519_092025-I.jpg', 'MLC412687', '2025-03-24T18:03:29.464Z'::timestamptz, '2026-01-21T16:34:09.813Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2857300512', NULL, 'Fuente De Agua Pileta De Agua Elefantes Grande 37 Cm Con Luz Gris', 39990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2857300512-fuente-de-agua-pileta-de-agua-elefantes-grande-37-cm-con-luz-gris-_JM', 'http://http2.mlstatic.com/D_933996-MLC82790056116_032025-I.jpg', 'MLC412687', '2025-03-14T11:01:37.206Z'::timestamptz, '2026-01-21T16:34:17.382Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1589018163', 'AKZZ08187', 'Naipe Ingles Cartas Inglesa Baraja Ingles Plastificado Poker Multicolor Inglés', 5000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1589018163-naipe-ingles-cartas-inglesa-baraja-ingles-plastificado-poker-multicolor-ingles-_JM', 'http://http2.mlstatic.com/D_996516-MLC82974949158_032025-I.jpg', 'MLC437050', '2025-03-20T14:06:25.922Z'::timestamptz, '2026-01-21T16:34:08.810Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2855996872', 'IZEQ97500', 'Estatua Dama De La Justicia Adorno Dama De La Justicia Plateado', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2855996872-estatua-dama-de-la-justicia-adorno-dama-de-la-justicia-plateado-_JM', 'http://http2.mlstatic.com/D_623802-MLC92248899704_092025-I.jpg', 'MLC412687', '2025-03-12T14:29:07.457Z'::timestamptz, '2026-01-21T16:44:23.396Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1585094821', 'UITQ30585', 'Set Jarra Y 6 Vasos Conjunto Jarra 2 Litros 6 Vasos Vidrio Transparente', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1585094821-set-jarra-y-6-vasos-conjunto-jarra-2-litros-6-vasos-vidrio-transparente-_JM', 'http://http2.mlstatic.com/D_972340-MLC83011397287_032025-I.jpg', 'MLC179055', '2025-03-11T18:19:15.552Z'::timestamptz, '2026-01-21T16:44:31.074Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2857327110', 'GGDR77202', 'Fuente De Agua Pileta De Agua Ganesha Interior 18cm Con Luz Dorado', 14993, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2857327110-fuente-de-agua-pileta-de-agua-ganesha-interior-18cm-con-luz-dorado-_JM', 'http://http2.mlstatic.com/D_925649-MLC82790142736_032025-I.jpg', 'MLC32663', '2025-03-14T11:11:58.460Z'::timestamptz, '2026-02-02T01:17:56.837Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1589044173', 'ONIH95990', 'Pack 4 Goma Eva Piso Alfombra Antigolpes 50x50x1cm Multicolor Liso', 6000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1589044173-pack-4-goma-eva-piso-alfombra-antigolpes-50x50x1cm-multicolor-liso-_JM', 'http://http2.mlstatic.com/D_832290-MLC82912455860_032025-I.jpg', 'MLC439869', '2025-03-20T14:23:19.904Z'::timestamptz, '2026-01-31T04:03:42.252Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2856881232', 'FZBB98605', 'Porta Cupcake Porta Torta Porta Cupcakes Campana Vidrio 28cm Color Transparente', 11554, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2856881232-porta-cupcake-porta-torta-porta-cupcakes-campana-vidrio-28cm-color-transparente-_JM', 'http://http2.mlstatic.com/D_672504-MLA82744621748_032025-I.jpg', 'MLC412621', '2025-03-13T22:55:58.753Z'::timestamptz, '2026-01-21T16:44:23.268Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2869610082', 'GCDT96217', 'Estatua Figura Gato Adorno Interior Color Blanco', 13990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2869610082-estatua-figura-gato-adorno-interior-color-blanco-_JM', 'http://http2.mlstatic.com/D_669419-MLA99963581527_112025-I.jpg', 'MLC412687', '2025-04-09T22:25:30.102Z'::timestamptz, '2026-01-21T16:34:12.031Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870455538', 'OETU23495', 'Biotina + Colágeno Hidrolizado', 4905, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870455538-biotina-colageno-hidrolizado-_JM', 'http://http2.mlstatic.com/D_858685-MLA99516678286_112025-I.jpg', 'MLC435304', '2025-04-10T22:22:13.288Z'::timestamptz, '2026-01-21T16:44:27.500Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870367566', 'OETU23495', 'Biotina + Colágeno Hidrolizado Con Vitamina C Extremo Sur Sin Sabor', 4905, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870367566-biotina-colageno-hidrolizado-con-vitamina-c-extremo-sur-sin-sabor-_JM', 'http://http2.mlstatic.com/D_628813-MLC83389828978_042025-I.jpg', 'MLC435304', '2025-04-10T22:22:12.714Z'::timestamptz, '2026-01-21T16:44:25.283Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596248009', 'NNRO14133', 'Fuente Pileta Cascada De Agua Buda Con Luz 18 Cm Feng Shui Color Gris', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1596248009-fuente-pileta-cascada-de-agua-buda-con-luz-18-cm-feng-shui-color-gris-_JM', 'http://http2.mlstatic.com/D_921047-MLA82745769816_032025-I.jpg', 'MLC412687', '2025-04-09T16:11:56.655Z'::timestamptz, '2026-01-21T16:44:31.164Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870329358', 'KGVC23495', 'Pack Magnesio Potasio Citrato 4 Frascos 180 Cápsulas Extremo Sur Sin Sabor', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870329358-pack-magnesio-potasio-citrato-4-frascos-180-capsulas-extremo-sur-sin-sabor-_JM', 'http://http2.mlstatic.com/D_765870-MLA99494781884_112025-I.jpg', 'MLC435304', '2025-04-10T23:01:35.941Z'::timestamptz, '2026-01-26T23:39:28.310Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2869353570', 'TXKF17810', 'La Última Cena Jesus Figura Decorativa Religiosa Adorno Marrón', 33320, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2869353570-la-ultima-cena-jesus-figura-decorativa-religiosa-adorno-marron-_JM', 'http://http2.mlstatic.com/D_806458-MLC83643936347_042025-I.jpg', 'MLC412687', '2025-04-09T15:31:30.322Z'::timestamptz, '2026-01-21T16:44:26.055Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870262782', 'RTKG09361', 'Basurero Papelero Pedal 5 L Acero Inoxidable', 7000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870262782-basurero-papelero-pedal-5-l-acero-inoxidable-_JM', 'http://http2.mlstatic.com/D_787126-MLA99821524029_112025-I.jpg', 'MLC436131', '2025-04-10T21:03:31.505Z'::timestamptz, '2026-01-21T16:44:31.263Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870456002', 'NSEZ21935', 'Zma Zinc + Magnesio + Vit B6 90 Capsulas 500mg Sabor Sin Sabor', 5404, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870456002-zma-zinc-magnesio-vit-b6-90-capsulas-500mg-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_606627-MLA100086517435_122025-I.jpg', 'MLC435304', '2025-04-10T23:30:44.552Z'::timestamptz, '2026-02-05T22:08:25.396Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1593130463', 'OQJG07815', 'Set 10 30x30 Alfombra Infantil Goma Eva Cuadros Bebes Niños Color Multicolor Liso', 4782, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1593130463-set-10-30x30-alfombra-infantil-goma-eva-cuadros-bebes-ninos-color-multicolor-liso-_JM', 'http://http2.mlstatic.com/D_921826-MLA83181750118_042025-I.jpg', 'MLC439869', '2025-04-01T18:35:05.679Z'::timestamptz, '2026-01-21T16:44:23.138Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596422757', 'UBBU18131', 'Naipe Ingles Cartas Inglesa Baraja Ingles Plastificado Poker Multicolor Inglés', 2500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1596422757-naipe-ingles-cartas-inglesa-baraja-ingles-plastificado-poker-multicolor-ingles-_JM', 'http://http2.mlstatic.com/D_699482-MLC83651607401_042025-I.jpg', 'MLC437050', '2025-04-09T22:12:47.698Z'::timestamptz, '2026-01-21T16:34:13.852Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2867073664', 'GJWQ08085', 'Alfombra Infantil Goma Eva Rugosa Números Bazaro Multicolor Set 10 Piezas 30x30cm Letras', 4782, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2867073664-alfombra-infantil-goma-eva-rugosa-numeros-bazaro-multicolor-set-10-piezas-30x30cm-letras-_JM', 'http://http2.mlstatic.com/D_607090-MLA100058693573_122025-I.jpg', 'MLC439869', '2025-04-04T12:36:03.761Z'::timestamptz, '2026-01-21T16:34:10.465Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870405916', 'XJEK98531', 'Basurero Papelero Pedal 12 Lts Acero Inoxidable Gris', 12500, 76, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870405916-basurero-papelero-pedal-12-lts-acero-inoxidable-gris-_JM', 'http://http2.mlstatic.com/D_704177-MLA99350051370_112025-I.jpg', 'MLC436131', '2025-04-10T21:05:29.688Z'::timestamptz, '2026-02-05T16:40:12.513Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870432286', 'DREG22517', '2 Bisglicinato De Magnesio 500mg X 60 Caps Vegetal Sabor Neutro', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870432286-2-bisglicinato-de-magnesio-500mg-x-60-caps-vegetal-sabor-neutro-_JM', 'http://http2.mlstatic.com/D_781300-MLA99466133896_112025-I.jpg', 'MLC435304', '2025-04-10T23:34:24.196Z'::timestamptz, '2026-01-21T16:34:13.323Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870367928', NULL, 'Citrato De Magnesio Cápsulas Extremo Sur Sin Sabor Libre De Gluten Vegano 45g', 10000, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2870367928-citrato-de-magnesio-capsulas-extremo-sur-sin-sabor-libre-de-gluten-vegano-45g-_JM', 'http://http2.mlstatic.com/D_651773-MLA99614355872_122025-I.jpg', 'MLC3551', '2025-04-10T23:05:28.984Z'::timestamptz, '2026-01-21T16:44:15.314Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870265058', 'DVMJ21864', 'L-treonato De Magnesio 500mg 90 Cápsulas 100% Natural Extremo Sur Sin Sabor', 9263, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2870265058-l-treonato-de-magnesio-500mg-90-capsulas-100-natural-extremo-sur-sin-sabor-_JM', 'http://http2.mlstatic.com/D_878112-MLU75721166832_042024-I.jpg', 'MLC435304', '2025-04-11T00:08:30.260Z'::timestamptz, '2026-01-21T16:44:21.343Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870329548', 'NSEZ21935', 'Zma Zinc + Magnesio + Vit B6 90 Capsulas 500mg Sabor Sin Sab Sin Sabor', 5404, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870329548-zma-zinc-magnesio-vit-b6-90-capsulas-500mg-sabor-sin-sab-sin-sabor-_JM', 'http://http2.mlstatic.com/D_695119-MLU74859779932_032024-I.jpg', 'MLC435304', '2025-04-10T23:30:43.947Z'::timestamptz, '2026-02-05T22:08:24.232Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2869377854', 'BIDY17950', 'Estatua Figura Religiosa Angel Virgen Maria Familia Sagrada Color Roble', 17493, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2869377854-estatua-figura-religiosa-angel-virgen-maria-familia-sagrada-color-roble-_JM', 'http://http2.mlstatic.com/D_765236-MLA96098382255_102025-I.jpg', 'MLC412687', '2025-04-09T15:49:31.077Z'::timestamptz, '2026-01-21T16:44:26.235Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870456220', 'DVMJ21864', 'L-treonato De Magnesio 500mg 90 Cápsulas 100% Natural Extrem Sin Sabor', 9263, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2870456220-l-treonato-de-magnesio-500mg-90-capsulas-100-natural-extrem-sin-sabor-_JM', 'http://http2.mlstatic.com/D_854519-MLU72611790593_112023-I.jpg', 'MLC435304', '2025-04-11T00:08:29.665Z'::timestamptz, '2026-01-21T16:34:15.226Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870432226', 'AQII22658', 'Pack De 3 Magnesio Malato 500mg 180 Cápsulas Vegetales Sabor Natural', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870432226-pack-de-3-magnesio-malato-500mg-180-capsulas-vegetales-sabor-natural-_JM', 'http://http2.mlstatic.com/D_620907-MLA99927473277_112025-I.jpg', 'MLC435304', '2025-04-10T23:26:42.369Z'::timestamptz, '2026-01-21T16:34:12.604Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870277888', 'AQII22658', 'Pack De 3 Magnesio Malato 500mg 180 Cápsulas Vegetales Sabor Natural', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870277888-pack-de-3-magnesio-malato-500mg-180-capsulas-vegetales-sabor-natural-_JM', 'http://http2.mlstatic.com/D_740281-MLU78012734089_072024-I.jpg', 'MLC435304', '2025-04-10T23:26:41.825Z'::timestamptz, '2026-01-23T05:25:17.084Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596962971', 'DREG22517', '2 Bisglicinato De Magnesio 500mg X 60 Caps Vegetal Sabor Neu Neutro', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1596962971-2-bisglicinato-de-magnesio-500mg-x-60-caps-vegetal-sabor-neu-neutro-_JM', 'http://http2.mlstatic.com/D_914215-MLU70850257767_082023-I.jpg', 'MLC435304', '2025-04-10T23:34:23.545Z'::timestamptz, '2026-01-21T16:34:10.447Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1598163137', NULL, 'Servilletero Ceramica Porta Servilletas De Frutilla 20 Cm Rojo', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1598163137-servilletero-ceramica-porta-servilletas-de-frutilla-20-cm-rojo-_JM', 'http://http2.mlstatic.com/D_753607-MLC83770635407_042025-I.jpg', 'MLC412712', '2025-04-14T22:46:49.643Z'::timestamptz, '2026-01-21T18:00:05.151Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2872122784', NULL, 'Salero Y Pimentero Para Mesa De Ceramica Calabaza Multicolor', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2872122784-salero-y-pimentero-para-mesa-de-ceramica-calabaza-multicolor-_JM', 'http://http2.mlstatic.com/D_963020-MLC83765086315_042025-I.jpg', 'MLC180830', '2025-04-14T16:40:27.834Z'::timestamptz, '2026-01-21T16:34:13.178Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2884550352', NULL, 'Mantequillera Cerámica Diseño Frutilla Rojo', 4199, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2884550352-mantequillera-ceramica-diseno-frutilla-rojo-_JM', 'http://http2.mlstatic.com/D_889465-MLA83433719254_042025-I.jpg', 'MLC455586', '2025-05-01T19:42:41.984Z'::timestamptz, '2026-01-22T17:43:48.712Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2872120342', NULL, 'Servilletero Ceramica Porta Servilletas De Calabaza 11 Cm Multicolor', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2872120342-servilletero-ceramica-porta-servilletas-de-calabaza-11-cm-multicolor-_JM', 'http://http2.mlstatic.com/D_895040-MLC83764044879_042025-I.jpg', 'MLC412712', '2025-04-14T15:54:59.700Z'::timestamptz, '2026-01-21T16:44:19.266Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596935131', 'ZTHJ08765', 'Basurero Papelero Pedal 3 Lts Acero Inoxidable Gris', 5200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1596935131-basurero-papelero-pedal-3-lts-acero-inoxidable-gris-_JM', 'http://http2.mlstatic.com/D_918183-MLA99414393392_112025-I.jpg', 'MLC436131', '2025-04-10T21:02:25.969Z'::timestamptz, '2026-01-30T10:55:15.855Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1598213735', NULL, 'Salero Y Pimentero Para Mesa De Ceramica Frutilla Rojo', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1598213735-salero-y-pimentero-para-mesa-de-ceramica-frutilla-rojo-_JM', 'http://http2.mlstatic.com/D_992785-MLC83770760413_042025-I.jpg', 'MLC180830', '2025-04-14T23:22:01.180Z'::timestamptz, '2026-01-21T16:44:23.205Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2870228100', 'KGVC23495', 'Pack 2 Magnesio Citrato 180 Cap Y 2 Potasio Citrato 180 Cap Sin Sabor', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2870228100-pack-2-magnesio-citrato-180-cap-y-2-potasio-citrato-180-cap-sin-sabor-_JM', 'http://http2.mlstatic.com/D_756649-MLU72610595417_112023-I.jpg', 'MLC435304', '2025-04-10T23:01:35.360Z'::timestamptz, '2026-01-21T16:44:33.311Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2872135864', NULL, 'Bombonera Con Tapa Bombonera Para Bombones Ceramica Frutilla Rojo', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2872135864-bombonera-con-tapa-bombonera-para-bombones-ceramica-frutilla-rojo-_JM', 'http://http2.mlstatic.com/D_623941-MLC83478089220_042025-I.jpg', 'MLC413490', '2025-04-14T22:53:10.857Z'::timestamptz, '2026-01-21T16:44:35.045Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1598182719', NULL, 'Bombonera Con Tapa Bombonera Para Bombones Ceramica Calabaza Multicolor', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1598182719-bombonera-con-tapa-bombonera-para-bombones-ceramica-calabaza-multicolor-_JM', 'http://http2.mlstatic.com/D_745825-MLC83766141995_042025-I.jpg', 'MLC413490', '2025-04-14T17:26:28.968Z'::timestamptz, '2026-01-21T16:34:09.440Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2884186274', 'PMTD44901', 'Citrato De Magnesio Zeo Sport 1 Kg En Polvo Suplemento Deportivo Sin Gluten Propio', 25486, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2884186274-citrato-de-magnesio-zeo-sport-1-kg-en-polvo-suplemento-deportivo-sin-gluten-propio-_JM', 'http://http2.mlstatic.com/D_656489-MLA99508348346_112025-I.jpg', 'MLC435304', '2025-05-01T01:11:09.649Z'::timestamptz, '2026-02-05T00:24:35.027Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2872031222', NULL, 'Tetera De Cerámica 850 Ml Calabaza Calabaza', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2872031222-tetera-de-ceramica-850-ml-calabaza-calabaza-_JM', 'http://http2.mlstatic.com/D_853758-MLC83760991595_042025-I.jpg', 'MLC440228', '2025-04-14T13:17:21.687Z'::timestamptz, '2026-01-21T16:34:10.437Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596922347', 'VJDW98343', 'Basurero 20 Litros Pedal De Acero Inoxidable Taumm Color Acero Inox Brillante', 19980, 32, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1596922347-basurero-20-litros-pedal-de-acero-inoxidable-taumm-color-acero-inox-brillante-_JM', 'http://http2.mlstatic.com/D_705142-MLA99349347244_112025-I.jpg', 'MLC436131', '2025-04-10T21:06:42.371Z'::timestamptz, '2026-02-05T17:32:05.593Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1598150129', NULL, 'Fuente Para Comida De Ceramica Frutilla 21cm Rojo', 10000, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1598150129-fuente-para-comida-de-ceramica-frutilla-21cm-rojo-_JM', 'http://http2.mlstatic.com/D_873250-MLC83477741806_042025-I.jpg', 'MLC440224', '2025-04-14T22:24:35.251Z'::timestamptz, '2026-01-21T16:44:28.354Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596775371', 'VJTK08224', 'Fuente Pileta Cascada De Agua Jesus Sagrado Con Luz 18 Cm Color Gris', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1596775371-fuente-pileta-cascada-de-agua-jesus-sagrado-con-luz-18-cm-color-gris-_JM', 'http://http2.mlstatic.com/D_989639-MLA92422096324_092025-I.jpg', 'MLC412687', '2025-04-10T16:33:13.866Z'::timestamptz, '2026-01-21T16:44:34.231Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596924193', NULL, 'Suplemento En Cápsula Extremo Sur Citrato De Magnesio X 45g Sin Sabor', 10000, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1596924193-suplemento-en-capsula-extremo-sur-citrato-de-magnesio-x-45g-sin-sabor-_JM', 'http://http2.mlstatic.com/D_879364-MLU78789499129_082024-I.jpg', 'MLC3551', '2025-04-10T23:05:28.382Z'::timestamptz, '2026-01-21T16:44:22.581Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2884173342', 'MFAD45514', 'Bisglicinato De Magnesio Zeo Sport 1000mg 90 Cápsulas Veganas Sin Sabor Sin Sabor (90 Capsulas)', 8720, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2884173342-bisglicinato-de-magnesio-zeo-sport-1000mg-90-capsulas-veganas-sin-sabor-sin-sabor-90-capsulas-_JM', 'http://http2.mlstatic.com/D_722472-MLA99872611623_112025-I.jpg', 'MLC435304', '2025-05-01T01:08:09.789Z'::timestamptz, '2026-02-04T21:59:57.697Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2884354532', 'ERLC46484', 'Citrato De Magnesio + L-triptófano 90 Capsulas Zeo Sport Sin Sabor', 7800, 80, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2884354532-citrato-de-magnesio-l-triptofano-90-capsulas-zeo-sport-sin-sabor-_JM', 'http://http2.mlstatic.com/D_970298-MLA99542391484_122025-I.jpg', 'MLC3551', '2025-05-01T01:10:09.835Z'::timestamptz, '2026-02-06T00:23:36.126Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2884237924', 'LOJO45885', 'Suplemento Zeo Sport Premium Citrato De Magnesio De 50g X 90 Unidades Sin Sabor', 5400, 71, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2884237924-suplemento-zeo-sport-premium-citrato-de-magnesio-de-50g-x-90-unidades-sin-sabor-_JM', 'http://http2.mlstatic.com/D_779167-MLA52628971309_112022-I.jpg', 'MLC3551', '2025-05-01T01:09:16.637Z'::timestamptz, '2026-02-06T00:23:38.200Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1596960925', 'QJPY07578', 'Basurero Papelero Pedal 8 Lts Acero Inoxidable Plateado', 10727, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1596960925-basurero-papelero-pedal-8-lts-acero-inoxidable-plateado-_JM', 'http://http2.mlstatic.com/D_855971-MLA99821567547_112025-I.jpg', 'MLC436131', '2025-04-10T21:06:21.614Z'::timestamptz, '2026-01-21T16:44:22.243Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2889296322', 'SFQB18261', 'Estatua Buda Cascada Pileta De Agua Con Luz Grande 28cm Color Gris', 31992, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2889296322-estatua-buda-cascada-pileta-de-agua-con-luz-grande-28cm-color-gris-_JM', 'http://http2.mlstatic.com/D_647690-MLA95502947549_102025-I.jpg', 'MLC412687', '2025-05-10T00:37:36.545Z'::timestamptz, '2026-01-21T16:34:12.844Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1608039965', 'MROQ35225', 'Strive Magnesio + L Triptófano 60 Cápsulas Nutricional Sin Sabor', 21815, 455, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1608039965-strive-magnesio-l-triptofano-60-capsulas-nutricional-sin-sabor-_JM', 'http://http2.mlstatic.com/D_950636-MLC84174241628_052025-I.jpg', 'MLC435304', '2025-05-07T04:24:34.255Z'::timestamptz, '2026-02-05T10:02:07.801Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2888551316', 'OUAI35169', 'Suplemento En Polvo Strive Creatina X 300g', 26991, 253, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2888551316-suplemento-en-polvo-strive-creatina-x-300g-_JM', 'http://http2.mlstatic.com/D_957735-MLA99901891605_112025-I.jpg', 'MLC435304', '2025-05-08T18:10:49.617Z'::timestamptz, '2026-02-05T22:38:12.314Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2886467526', 'ERLC36154', 'Citrato De Magnesio Cápsulas Extremo Sur 500mg Sin Sabor X270 Unidades', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2886467526-citrato-de-magnesio-capsulas-extremo-sur-500mg-sin-sabor-x270-unidades-_JM', 'http://http2.mlstatic.com/D_773777-MLA99977033887_112025-I.jpg', 'MLC3551', '2025-05-06T07:27:11.567Z'::timestamptz, '2026-01-21T16:44:35.003Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1608812577', 'GJWQ34326', 'Your Goal Barra Proteica Protein Bite Caramel Peanuts 20g Proteína Caramel Peanuts Salty', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1608812577-your-goal-barra-proteica-protein-bite-caramel-peanuts-20g-proteina-caramel-peanuts-salty-_JM', 'http://http2.mlstatic.com/D_790650-MLA100007131433_122025-I.jpg', 'MLC435304', '2025-05-08T15:53:05.779Z'::timestamptz, '2026-01-23T16:15:07.364Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2886227406', 'OJUL35362', 'Extremo Sur - Melena De Leon 500mg 60 Cap. 100% Natural', 7678, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2886227406-extremo-sur-melena-de-leon-500mg-60-cap-100-natural-_JM', 'http://http2.mlstatic.com/D_657815-MLA100053619809_122025-I.jpg', 'MLC435304', '2025-05-06T07:29:51.301Z'::timestamptz, '2026-01-21T16:44:17.317Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1607933771', 'DEID36112', 'Pack 10 Sobres Superzings Figuras Coleccionables Serie 3', 6512, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1607933771-pack-10-sobres-superzings-figuras-coleccionables-serie-3-_JM', 'http://http2.mlstatic.com/D_863704-MLC84094248230_052025-I.jpg', 'MLC3422', '2025-05-06T20:03:02.899Z'::timestamptz, '2026-01-21T16:44:26.489Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2886162644', 'GFQI34645', 'Vitamina C 90 Cap De 500mg 100% Natural Extremo Sur Sin Sabor', 3232, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2886162644-vitamina-c-90-cap-de-500mg-100-natural-extremo-sur-sin-sabor-_JM', 'http://http2.mlstatic.com/D_913908-MLA99936184463_112025-I.jpg', 'MLC435304', '2025-05-06T07:32:35.951Z'::timestamptz, '2026-02-06T00:07:18.255Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2890055674', 'SGMT34927', 'Pileta Fuente Cascada Agua Religiosa Niño Jesus San Jose Gris', 39990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2890055674-pileta-fuente-cascada-agua-religiosa-nino-jesus-san-jose-gris-_JM', 'http://http2.mlstatic.com/D_720125-MLC84280545386_052025-I.jpg', 'MLC412687', '2025-05-11T20:36:02.202Z'::timestamptz, '2026-01-21T16:44:28.998Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2888547512', 'USJD34390', 'Barras De Proteina Protein Bite Black & White Pack 4 Barrita', 7990, 202, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2888547512-barras-de-proteina-protein-bite-black-white-pack-4-barrita-_JM', 'http://http2.mlstatic.com/D_864555-MLU78041600064_082024-I.jpg', 'MLC376470', '2025-05-08T15:58:08.253Z'::timestamptz, '2026-02-06T01:25:11.791Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2886979324', 'DEID36112', 'Super Zings Serie 3 Pack 10 Sobres 1 Figura Por Sobre', 6512, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2886979324-super-zings-serie-3-pack-10-sobres-1-figura-por-sobre-_JM', 'http://http2.mlstatic.com/D_643738-MLA99451834370_112025-I.jpg', 'MLC3422', '2025-05-06T20:03:03.549Z'::timestamptz, '2026-01-21T16:44:25.519Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1609863627', 'UBBU18131', 'Cartas Inglesas Poker Bazaroimportaciones 2 Mazos Plástico A Prueba De Agua Multicolor Baraja Inglés', 2500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1609863627-cartas-inglesas-poker-bazaroimportaciones-2-mazos-plastico-a-prueba-de-agua-multicolor-baraja-ingles-_JM', 'http://http2.mlstatic.com/D_943584-MLA100078826177_122025-I.jpg', 'MLC437050', '2025-05-10T14:57:00.840Z'::timestamptz, '2026-01-21T16:34:10.138Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2892393542', 'VCFG38676', 'Set 29 9x9 Piezas Alfombra Goma Eva Cuadros Bebe Niños Multicolor Números', 5000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2892393542-set-29-9x9-piezas-alfombra-goma-eva-cuadros-bebe-ninos-multicolor-numeros-_JM', 'http://http2.mlstatic.com/D_844071-MLC86348242031_062025-I.jpg', 'MLC439869', '2025-05-14T16:46:48.819Z'::timestamptz, '2026-01-21T16:44:26.508Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1608980449', 'USJD34390', 'Barras De Proteina Protein Bite Black & White Pack 4 Barritas 55g C/u Yourgoal Nutrition Suplemento Con Proteina', 7990, 202, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1608980449-barras-de-proteina-protein-bite-black-white-pack-4-barritas-55g-cu-yourgoal-nutrition-suplemento-con-proteina-_JM', 'http://http2.mlstatic.com/D_687262-MLA99843143859_112025-I.jpg', 'MLC376470', '2025-05-08T15:58:08.896Z'::timestamptz, '2026-02-06T01:25:11.777Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2888575494', 'OUAI35169', 'Creatina Monohidratada Micronizada - 300gr, Strive Sin Sabor Sin Sabor', 26991, 253, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2888575494-creatina-monohidratada-micronizada-300gr-strive-sin-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_876215-MLC84475060361_052025-I.jpg', 'MLC435304', '2025-05-08T18:10:49.053Z'::timestamptz, '2026-02-05T22:38:12.325Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1609044811', 'GJWQ34326', 'Barras De Proteinas Yourgoal Protein Bite 4u Caramel Peanuts Caramel Peanuts Salty', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1609044811-barras-de-proteinas-yourgoal-protein-bite-4u-caramel-peanuts-caramel-peanuts-salty-_JM', 'http://http2.mlstatic.com/D_831147-MLC84178489066_052025-I.jpg', 'MLC435304', '2025-05-08T15:53:05.146Z'::timestamptz, '2026-01-23T16:15:07.368Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2892446834', 'FDEO38837', 'Set27 5x5cm Abecedario Letras Gomaeva Bebe Alfombra Infantil Multicolor Abecedario', 2400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2892446834-set27-5x5cm-abecedario-letras-gomaeva-bebe-alfombra-infantil-multicolor-abecedario-_JM', 'http://http2.mlstatic.com/D_712387-MLC86033889770_062025-I.jpg', 'MLC439869', '2025-05-14T17:02:12.636Z'::timestamptz, '2026-01-21T16:34:13.864Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2892355596', 'WKSZ40212', 'Set 10 9x9cm Alfombra Infantil Goma Eva Cuadros Bebes Niños Multicolor Números', 3000, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2892355596-set-10-9x9cm-alfombra-infantil-goma-eva-cuadros-bebes-ninos-multicolor-numeros-_JM', 'http://http2.mlstatic.com/D_789527-MLC88729411410_072025-I.jpg', 'MLC439869', '2025-05-14T16:58:12.857Z'::timestamptz, '2026-02-03T15:51:39.369Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2892298602', 'CMPF96621', 'Pack 4 Goma Eva Piso Alfombra Antigolpes 60x60cm 1cm Grosor Color Beige', 9618, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2892298602-pack-4-goma-eva-piso-alfombra-antigolpes-60x60cm-1cm-grosor-color-beige-_JM', 'http://http2.mlstatic.com/D_962345-MLA82725111558_032025-I.jpg', 'MLC439869', '2025-05-14T15:43:24.324Z'::timestamptz, '2026-01-21T16:44:20.516Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2888665676', 'JABX35148', 'Super Zings Serie 3 - Caja Sellada 25 Personajes', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2888665676-super-zings-serie-3-caja-sellada-25-personajes-_JM', 'http://http2.mlstatic.com/D_671144-MLC84474168669_052025-I.jpg', 'MLC3422', '2025-05-08T18:24:55.617Z'::timestamptz, '2026-01-21T16:44:26.769Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611409059', 'SWOH38010', 'Crema Bálsamo Para Rozaduras De Pañal 100 Ml Mustela', 8490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611409059-crema-balsamo-para-rozaduras-de-panal-100-ml-mustela-_JM', 'http://http2.mlstatic.com/D_741437-MLU74331190034_022024-I.jpg', 'MLC418673', '2025-05-14T19:37:02.982Z'::timestamptz, '2026-01-31T20:00:02.380Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895816052', 'BRCH40174', 'Barras De Proteína Your Goal Snack Bayas Glaseado Blanco 5x42g Sin Gluten', 6500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2895816052-barras-de-proteina-your-goal-snack-bayas-glaseado-blanco-5x42g-sin-gluten-_JM', 'http://http2.mlstatic.com/D_627638-MLA99832058791_112025-I.jpg', 'MLC376470', '2025-05-17T05:47:25.126Z'::timestamptz, '2026-01-21T16:34:09.469Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611460233', 'LYSO39694', 'Shampoo Alpecin Cafeína Doble Efecto Anticaída 200 Ml', 10574, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611460233-shampoo-alpecin-cafeina-doble-efecto-anticaida-200-ml-_JM', 'http://http2.mlstatic.com/D_883683-MLU74538285491_022024-I.jpg', 'MLC8163', '2025-05-14T19:07:36.502Z'::timestamptz, '2026-02-05T01:53:16.808Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895881538', 'VRZA39320', 'Barras De Proteina Yourgoal Twentys 12u Lemon Cheesecake Lemon Cheesecake', 24990, 4, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2895881538-barras-de-proteina-yourgoal-twentys-12u-lemon-cheesecake-lemon-cheesecake-_JM', 'http://http2.mlstatic.com/D_935358-MLU73715657990_012024-I.jpg', 'MLC435304', '2025-05-17T06:04:40.831Z'::timestamptz, '2026-02-05T17:10:11.653Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611551879', 'TKHQ39813', 'Shampoo Controlgx Control Gx Just For Men Tinte Shampoo Y Sh', 16990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611551879-shampoo-controlgx-control-gx-just-for-men-tinte-shampoo-y-sh-_JM', 'http://http2.mlstatic.com/D_929725-MLA74782362319_022024-I.jpg', 'MLC8163', '2025-05-14T19:39:56.512Z'::timestamptz, '2026-01-21T16:34:12.861Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611512641', 'NNHZ37732', 'Alisado Brasilero Para Todo Tipo De Cabello', 10857, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611512641-alisado-brasilero-para-todo-tipo-de-cabello-_JM', 'http://http2.mlstatic.com/D_948175-MLA99936777541_112025-I.jpg', 'MLC1266', '2025-05-14T19:35:19.397Z'::timestamptz, '2026-01-21T16:44:22.900Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611427455', 'MWXT96147', 'Candelabro Vidrio Portavela Vidrio 15 Cm Transparente', 10000, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611427455-candelabro-vidrio-portavela-vidrio-15-cm-transparente-_JM', 'http://http2.mlstatic.com/D_632815-MLC88761534101_072025-I.jpg', 'MLC413412', '2025-05-14T17:08:16.400Z'::timestamptz, '2026-01-26T14:28:50.733Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611370149', 'XIXB39100', 'Crema Mustela Hydra Bebe Facial 40ml', 5990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611370149-crema-mustela-hydra-bebe-facial-40ml-_JM', 'http://http2.mlstatic.com/D_754628-MLA99901274303_112025-I.jpg', 'MLC418673', '2025-05-14T19:42:09.758Z'::timestamptz, '2026-01-31T16:02:28.050Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895855204', 'YTRQ38925', 'Your Goal Protein Snack Barra Rich Caramel Caja 5 Uni Libre De Gluten', 6208, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2895855204-your-goal-protein-snack-barra-rich-caramel-caja-5-uni-libre-de-gluten-_JM', 'http://http2.mlstatic.com/D_675588-MLA100047234837_122025-I.jpg', 'MLC376470', '2025-05-17T05:55:19.069Z'::timestamptz, '2026-02-05T09:12:33.775Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895842164', 'YTRQ38925', 'Yourgoal Barra Protein Snack Rich Caramel Caja 5un', 6208, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2895842164-yourgoal-barra-protein-snack-rich-caramel-caja-5un-_JM', 'http://http2.mlstatic.com/D_870714-MLU73714129990_012024-I.jpg', 'MLC376470', '2025-05-17T05:55:18.492Z'::timestamptz, '2026-02-05T09:12:33.780Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611330597', 'LYSO39694', 'Shampoo Alpecin Cafeína Doble Efecto Anticaída 200 Ml', 10574, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611330597-shampoo-alpecin-cafeina-doble-efecto-anticaida-200-ml-_JM', 'http://http2.mlstatic.com/D_764535-MLA99927119163_112025-I.jpg', 'MLC8163', '2025-05-14T19:07:37.076Z'::timestamptz, '2026-02-05T01:53:16.805Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611486875', 'TKHQ39813', 'Shampoo Controlgx Control Gx Just For Men Tinte Shampoo Y Shampoo Matizador De Coco En Tubo Depresible De 118ml Por 1 Unidad', 16990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611486875-shampoo-controlgx-control-gx-just-for-men-tinte-shampoo-y-shampoo-matizador-de-coco-en-tubo-depresible-de-118ml-por-1-unidad-_JM', 'http://http2.mlstatic.com/D_929725-MLA74782362319_022024-I.jpg', 'MLC8163', '2025-05-14T19:39:57.088Z'::timestamptz, '2026-01-21T16:44:25.961Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611382963', 'PZQP38386', 'Mustela Gel De Baño 500 Ml Botella', 9490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611382963-mustela-gel-de-bano-500-ml-botella-_JM', 'http://http2.mlstatic.com/D_909599-MLU74246707991_012024-I.jpg', 'MLC392701', '2025-05-14T19:32:42.050Z'::timestamptz, '2026-01-21T16:44:20.282Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611538777', 'SWOH38010', 'Mustela Crema Preventiva De Pañal Vitaminada 123 Bebé 100ml', 8490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611538777-mustela-crema-preventiva-de-panal-vitaminada-123-bebe-100ml-_JM', 'http://http2.mlstatic.com/D_825106-MLA99853088649_112025-I.jpg', 'MLC418673', '2025-05-14T19:37:03.503Z'::timestamptz, '2026-01-31T20:00:02.380Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611318043', 'PZQP38386', 'Mustela Gel De Baño 500 Ml Botella', 9490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611318043-mustela-gel-de-bano-500-ml-botella-_JM', 'http://http2.mlstatic.com/D_909599-MLU74246707991_012024-I.jpg', 'MLC392701', '2025-05-14T19:32:42.647Z'::timestamptz, '2026-01-21T16:44:18.264Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611435373', 'EVGP38465', 'Goma Eva Plegable Niños Bebes Multicolor', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611435373-goma-eva-plegable-ninos-bebes-multicolor-_JM', 'http://http2.mlstatic.com/D_711669-MLC88779232280_082025-I.jpg', 'MLC439869', '2025-05-14T19:53:45.387Z'::timestamptz, '2026-01-21T16:44:34.289Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611564729', 'XIXB39100', 'Mustela Crema Facial Hydra Bebé Piel Normal 40ml', 5990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611564729-mustela-crema-facial-hydra-bebe-piel-normal-40ml-_JM', 'http://http2.mlstatic.com/D_938785-MLC86054215608_062025-I.jpg', 'MLC418673', '2025-05-14T19:42:09.182Z'::timestamptz, '2026-01-31T16:02:28.042Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2892225070', 'ZVRI39625', 'Set 60 5x5 Alfombra Infantil Goma Eva Cuadros Bebes Numeros Multicolor Números', 2000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2892225070-set-60-5x5-alfombra-infantil-goma-eva-cuadros-bebes-numeros-multicolor-numeros-_JM', 'http://http2.mlstatic.com/D_974984-MLC88654319756_072025-I.jpg', 'MLC439869', '2025-05-14T16:53:27.293Z'::timestamptz, '2026-01-21T16:34:15.339Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611357713', 'TXKF37830', 'Alpecin Anti Calvicie Loción Cafeína Líquida 200 Ml', 11490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611357713-alpecin-anti-calvicie-locion-cafeina-liquida-200-ml-_JM', 'http://http2.mlstatic.com/D_913797-MLC90180280422_082025-I.jpg', 'MLC1266', '2025-05-14T20:08:15.021Z'::timestamptz, '2026-01-21T16:44:28.294Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1611344217', 'NNHZ37732', 'Alisado Brasilero Para Todo Tipo De Cabello', 10857, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1611344217-alisado-brasilero-para-todo-tipo-de-cabello-_JM', 'http://http2.mlstatic.com/D_814156-MLU72646584019_112023-I.jpg', 'MLC1266', '2025-05-14T19:35:18.865Z'::timestamptz, '2026-01-21T16:44:34.289Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896293684', NULL, 'Lubricante Omg Bentley Estimulante Estimulante', 6990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2896293684-lubricante-omg-bentley-estimulante-estimulante-_JM', 'http://http2.mlstatic.com/D_746612-MLA82117218288_022025-I.jpg', 'MLC431657', '2025-05-19T05:29:56.418Z'::timestamptz, '2026-01-21T16:34:09.456Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896306604', 'VSCV39911', 'Preservativos Condones Lifestyles X21un Vibra Ribbed Stimula', 8464, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896306604-preservativos-condones-lifestyles-x21un-vibra-ribbed-stimula-_JM', 'http://http2.mlstatic.com/D_881289-MLU74126738727_012024-I.jpg', 'MLC174813', '2025-05-19T05:38:50.924Z'::timestamptz, '2026-01-21T16:44:30.127Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896358342', 'VSCV39911', 'Preservativos Condones Lifestyles X21un Vibra Ribbed Stimula', 8464, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896358342-preservativos-condones-lifestyles-x21un-vibra-ribbed-stimula-_JM', 'http://http2.mlstatic.com/D_626479-MLA99898071311_112025-I.jpg', 'MLC174813', '2025-05-19T05:38:51.386Z'::timestamptz, '2026-01-21T16:44:31.143Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896409798', NULL, 'Bentley Gel Lubricante Chocolate Menta 50 Gr. Chocolate/menta', 2990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2896409798-bentley-gel-lubricante-chocolate-menta-50-gr-chocolatementa-_JM', 'http://http2.mlstatic.com/D_832594-MLA84215607330_052025-I.jpg', 'MLC400500', '2025-05-19T05:34:47.943Z'::timestamptz, '2026-01-21T16:34:10.572Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896293694', 'QJPY40895', 'Bentley Classic Gel Lubricante Íntimo 50 Gr', 3594, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896293694-bentley-classic-gel-lubricante-intimo-50-gr-_JM', 'http://http2.mlstatic.com/D_616488-MLA84174830096_052025-I.jpg', 'MLC400500', '2025-05-19T05:32:10.223Z'::timestamptz, '2026-01-21T16:44:21.346Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895607974', 'ORGZ40502', 'Barras De Proteina Protein Snack Sabor Chocolate & Crispis Pack 5 Barritas 42g C/u Yourgoal Nutrition Suplemento Con Proteina', 6500, 54, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2895607974-barras-de-proteina-protein-snack-sabor-chocolate-crispis-pack-5-barritas-42g-cu-yourgoal-nutrition-suplemento-con-proteina-_JM', 'http://http2.mlstatic.com/D_870083-MLA99419193488_112025-I.jpg', 'MLC376470', '2025-05-17T05:42:13.728Z'::timestamptz, '2026-02-05T21:25:10.596Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895582228', 'EVTH83082', 'Yourgoal Barra De Proteína Sabor Banana Chips & Caramel Sin Gluten Caja 5 Unidades', 6400, 68, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2895582228-yourgoal-barra-de-proteina-sabor-banana-chips-caramel-sin-gluten-caja-5-unidades-_JM', 'http://http2.mlstatic.com/D_655767-MLA99971094391_112025-I.jpg', 'MLC3551', '2025-05-17T05:58:20.497Z'::timestamptz, '2026-02-06T01:24:50.038Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895751464', 'AFHP39401', 'Barra De Proteína Your Goal Sabor Brownie De Chocolate Pack 12 Keto Friendly', 25700, 35, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2895751464-barra-de-proteina-your-goal-sabor-brownie-de-chocolate-pack-12-keto-friendly-_JM', 'http://http2.mlstatic.com/D_822654-MLA95145590863_102025-I.jpg', 'MLC3551', '2025-05-17T06:01:47.363Z'::timestamptz, '2026-02-05T22:48:24.850Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896293802', 'DNGW41311', 'Preservativo Lifestyles Skyn Large - 6 Unidades', 9490, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2896293802-preservativo-lifestyles-skyn-large-6-unidades-_JM', 'http://http2.mlstatic.com/D_848412-MLA99412753990_112025-I.jpg', 'MLC174813', '2025-05-19T05:37:46.195Z'::timestamptz, '2026-01-21T16:44:39.289Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895647764', NULL, 'Barras De Proteína Your Goal Chocolate Fudge Pack 12x60g Sin Gluten', 26194, 142, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2895647764-barras-de-proteina-your-goal-chocolate-fudge-pack-12x60g-sin-gluten-_JM', 'http://http2.mlstatic.com/D_826566-MLA99885778937_112025-I.jpg', 'MLC435304', '2025-05-17T06:07:42.877Z'::timestamptz, '2026-02-06T00:54:53.381Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896358394', 'RXSP40594', 'Preservativo Lifestyles Skyn Original De 15 Unidades', 12552, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896358394-preservativo-lifestyles-skyn-original-de-15-unidades-_JM', 'http://http2.mlstatic.com/D_792000-MLA99435852678_112025-I.jpg', 'MLC174813', '2025-05-19T05:39:59.347Z'::timestamptz, '2026-01-21T16:34:12.949Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895725876', 'HQJA40103', 'Your Goal Barras Proteína Whey Hazelnut Praline Sin Gluten 12x60g', 25390, 36, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2895725876-your-goal-barras-proteina-whey-hazelnut-praline-sin-gluten-12x60g-_JM', 'http://http2.mlstatic.com/D_993717-MLA99925131805_112025-I.jpg', 'MLC3551', '2025-05-17T06:11:41.605Z'::timestamptz, '2026-02-05T22:02:36.613Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896345276', NULL, 'Lubricante Omg Bentley Estimulante', 6990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2896345276-lubricante-omg-bentley-estimulante-_JM', 'http://http2.mlstatic.com/D_746612-MLA82117218288_022025-I.jpg', 'MLC431657', '2025-05-19T05:29:56.939Z'::timestamptz, '2026-01-21T16:44:29.803Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895764124', 'BRCH40174', 'Barras De Proteina Protein Sanck Sabor Snack Berries & White', 6500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2895764124-barras-de-proteina-protein-sanck-sabor-snack-berries-white-_JM', 'http://http2.mlstatic.com/D_743899-MLU79017340826_092024-I.jpg', 'MLC376470', '2025-05-17T05:47:24.573Z'::timestamptz, '2026-01-21T16:44:33.767Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895647120', 'ORGZ40502', 'Barras De Proteina Protein Snack Sabor Chocolate & Crispis P', 6500, 54, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2895647120-barras-de-proteina-protein-snack-sabor-chocolate-crispis-p-_JM', 'http://http2.mlstatic.com/D_615403-MLU73785543054_012024-I.jpg', 'MLC376470', '2025-05-17T05:42:13.118Z'::timestamptz, '2026-02-05T21:25:10.625Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896370886', 'WTNN39591', 'Crevet Limonada Con Stevia 60 Sobres Vit C+ Propóleo + Zinc Limonada', 8234, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896370886-crevet-limonada-con-stevia-60-sobres-vit-c-propoleo-zinc-limonada-_JM', 'http://http2.mlstatic.com/D_716856-MLU72606756983_102023-I.jpg', 'MLC435304', '2025-05-19T05:26:55.838Z'::timestamptz, '2026-01-21T16:44:34.092Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896396666', NULL, 'Lubricante Bentley Tropical', 3990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2896396666-lubricante-bentley-tropical-_JM', 'http://http2.mlstatic.com/D_830353-MLA84471093333_052025-I.jpg', 'MLC400500', '2025-05-19T05:33:28.128Z'::timestamptz, '2026-01-21T16:34:13.120Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896370956', 'QJPY40895', 'Bentley Classic Gel 50 Gr.', 3594, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896370956-bentley-classic-gel-50-gr-_JM', 'http://http2.mlstatic.com/D_679212-MLA105360060483_012026-I.jpg', 'MLC400500', '2025-05-19T05:32:10.817Z'::timestamptz, '2026-01-27T00:33:01.945Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896370888', 'WTNN39591', 'Crevet Limonada Con Stevia 60 Sobres Vitamina C Zinc Propóleo Inmunidad', 8234, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896370888-crevet-limonada-con-stevia-60-sobres-vitamina-c-zinc-propoleo-inmunidad-_JM', 'http://http2.mlstatic.com/D_989026-MLA104655360831_012026-I.jpg', 'MLC435304', '2025-05-19T05:26:56.368Z'::timestamptz, '2026-01-26T23:12:08.710Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2895530748', 'VRZA39320', 'Barras De Proteína Your Goal Twentys Lemon Cheesecake 21g X 12u', 24990, 4, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2895530748-barras-de-proteina-your-goal-twentys-lemon-cheesecake-21g-x-12u-_JM', 'http://http2.mlstatic.com/D_811814-MLA99934031373_112025-I.jpg', 'MLC435304', '2025-05-17T06:04:41.324Z'::timestamptz, '2026-02-05T17:10:11.754Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896241788', 'FKXI40489', 'Preservativos Skyn Elite Ultra Delgado Libre De Látex  X3un', 4300, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896241788-preservativos-skyn-elite-ultra-delgado-libre-de-latex-x3un-_JM', 'http://http2.mlstatic.com/D_968278-MLA82567601937_022025-I.jpg', 'MLC174813', '2025-05-19T05:28:27.958Z'::timestamptz, '2026-01-21T16:44:16.583Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900097404', 'MWPS42667', 'Triple Magnesio 60 Cápsulas Relajación Ortomolecular Chile Sin Sabor', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2900097404-triple-magnesio-60-capsulas-relajacion-ortomolecular-chile-sin-sabor-_JM', 'http://http2.mlstatic.com/D_915390-MLA100581869718_122025-I.jpg', 'MLC435304', '2025-05-22T19:03:37.779Z'::timestamptz, '2026-01-27T23:46:39.068Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900071444', 'VIMA44098', 'D-manosa + Cranberry + Probióticos 90 Cápsulas Ortomolecular Sin Sabor', 39324, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2900071444-d-manosa-cranberry-probioticos-90-capsulas-ortomolecular-sin-sabor-_JM', 'http://http2.mlstatic.com/D_701570-MLU73746425342_012024-I.jpg', 'MLC435304', '2025-05-22T19:02:34.154Z'::timestamptz, '2026-02-05T22:29:38.844Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896190010', 'YYED39969', 'Bentley Frutilla Gel 50 Gr.', 3211, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896190010-bentley-frutilla-gel-50-gr-_JM', 'http://http2.mlstatic.com/D_971056-MLA104618931076_012026-I.jpg', 'MLC400500', '2025-05-19T05:36:21.124Z'::timestamptz, '2026-01-25T07:11:37.568Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900107914', 'QWRL42963', 'Ultra Vision 400mg 60 Capsulas Ortomolecular Sin Sabor', 20200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2900107914-ultra-vision-400mg-60-capsulas-ortomolecular-sin-sabor-_JM', 'http://http2.mlstatic.com/D_896742-MLA99482297640_112025-I.jpg', 'MLC435304', '2025-05-22T19:01:24.107Z'::timestamptz, '2026-01-28T23:40:10.665Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1614051993', 'MROQ35225', 'Strive Triple Magnesio + L Triptófano 60 Cápsulas', 21815, 455, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1614051993-strive-triple-magnesio-l-triptofano-60-capsulas-_JM', 'http://http2.mlstatic.com/D_822008-MLA99936998691_112025-I.jpg', 'MLC435304', '2025-05-19T16:50:27.928Z'::timestamptz, '2026-02-05T10:02:07.800Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896267476', 'FKXI40489', 'Preservativos Prime Skyn Elite Sin Latex Finos X 3 Un', 4300, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896267476-preservativos-prime-skyn-elite-sin-latex-finos-x-3-un-_JM', 'http://http2.mlstatic.com/D_709441-MLA99412773432_112025-I.jpg', 'MLC174813', '2025-05-19T05:28:28.446Z'::timestamptz, '2026-01-21T16:34:11.837Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2899985622', 'KJKA42890', 'Ácido Caprílico 500 Mg 90 Cápsulas Vegetales Ortomolecular C Sin Sabor', 18490, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2899985622-acido-caprilico-500-mg-90-capsulas-vegetales-ortomolecular-c-sin-sabor-_JM', 'http://http2.mlstatic.com/D_621747-MLU78702665761_082024-I.jpg', 'MLC435304', '2025-05-22T19:00:10.694Z'::timestamptz, '2026-02-05T22:31:24.506Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1613741927', 'YYED39969', 'Bentley Frutilla Gel 50 Gr. Frutilla', 3211, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1613741927-bentley-frutilla-gel-50-gr-frutilla-_JM', 'http://http2.mlstatic.com/D_885761-MLC90667536309_082025-I.jpg', 'MLC400500', '2025-05-19T05:36:20.589Z'::timestamptz, '2026-01-22T19:10:45.581Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900961600', 'GHCJ43674', 'Crema Aclarante Capilar Aclarante Para Cabello Ritzy Mash - Sin Tono', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2900961600-crema-aclarante-capilar-aclarante-para-cabello-ritzy-mash-sin-tono-_JM', 'http://http2.mlstatic.com/D_607931-MLC85149853008_052025-I.jpg', 'MLC174669', '2025-05-23T16:56:07.005Z'::timestamptz, '2026-01-28T21:53:25.170Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900071030', 'UVVN42819', 'Pileje Probiotico Lactibiane Atb 10 Caps Sabor Natural Natural', 10990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2900071030-pileje-probiotico-lactibiane-atb-10-caps-sabor-natural-natural-_JM', 'http://http2.mlstatic.com/D_681248-MLA80111505973_102024-I.jpg', 'MLC435304', '2025-05-22T18:58:29.393Z'::timestamptz, '2026-01-21T16:44:29.265Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896190122', 'RXSP40594', 'Preservativo Lifestyles Skyn Original De 15 Unidades', 12552, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2896190122-preservativo-lifestyles-skyn-original-de-15-unidades-_JM', 'http://http2.mlstatic.com/D_834808-MLU74842572696_032024-I.jpg', 'MLC174813', '2025-05-19T05:39:58.870Z'::timestamptz, '2026-01-21T16:34:11.148Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896280488', NULL, 'Bentley Tropical Passion Gel Lubricante Intimo 50 Gr Tropical', 3990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2896280488-bentley-tropical-passion-gel-lubricante-intimo-50-gr-tropical-_JM', 'http://http2.mlstatic.com/D_830353-MLA84471093333_052025-I.jpg', 'MLC400500', '2025-05-19T05:33:27.571Z'::timestamptz, '2026-01-21T16:44:34.322Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2896280586', 'DNGW41311', 'Skyn Large X 6', 9490, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2896280586-skyn-large-x-6-_JM', 'http://http2.mlstatic.com/D_891474-MLA84479409091_052025-I.jpg', 'MLC174813', '2025-05-19T05:37:45.716Z'::timestamptz, '2026-01-21T16:44:29.138Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900145920', 'KJKA42890', 'Acido Caprilico 500mg 90 Capsulas Vegetales Ortomolecular Chile Sin Sabor', 18490, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2900145920-acido-caprilico-500mg-90-capsulas-vegetales-ortomolecular-chile-sin-sabor-_JM', 'http://http2.mlstatic.com/D_807556-MLA100045858359_122025-I.jpg', 'MLC435304', '2025-05-22T19:00:11.280Z'::timestamptz, '2026-02-05T22:31:26.919Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900097204', 'QWRL42963', 'Ultra Visión 399 Mg - 60 Cáps - Ortomolecular Chile Sin Sabor', 20200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2900097204-ultra-vision-399-mg-60-caps-ortomolecular-chile-sin-sabor-_JM', 'http://http2.mlstatic.com/D_956136-MLU70416025755_072023-I.jpg', 'MLC435304', '2025-05-22T19:01:23.540Z'::timestamptz, '2026-01-21T16:44:25.929Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1613733673', NULL, 'Bentley Gel Lubricante Chocolate Menta 50 Gr.', 2990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1613733673-bentley-gel-lubricante-chocolate-menta-50-gr-_JM', 'http://http2.mlstatic.com/D_832594-MLA84215607330_052025-I.jpg', 'MLC400500', '2025-05-19T05:34:48.494Z'::timestamptz, '2026-01-21T16:44:20.280Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900158584', 'UVVN42819', 'Pileje Probiotico Lactibiane Atb 10 Caps Sabor Natural', 10990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2900158584-pileje-probiotico-lactibiane-atb-10-caps-sabor-natural-_JM', 'http://http2.mlstatic.com/D_953573-MLA99508564874_112025-I.jpg', 'MLC435304', '2025-05-22T18:58:29.968Z'::timestamptz, '2026-01-21T16:34:10.699Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900071446', 'VIMA44098', 'D-manosa Probióticos 90 Cápsulas Ortomolecular Sin Sabor', 39324, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2900071446-d-manosa-probioticos-90-capsulas-ortomolecular-sin-sabor-_JM', 'http://http2.mlstatic.com/D_882620-MLA101056706784_122025-I.jpg', 'MLC435304', '2025-05-22T19:02:34.832Z'::timestamptz, '2026-02-05T22:29:41.278Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2900097400', 'MWPS42667', 'Ultra Magnesio Triple 60 Cápsulas Ortomolecular Chile Suplem Sin Sabor', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2900097400-ultra-magnesio-triple-60-capsulas-ortomolecular-chile-suplem-sin-sabor-_JM', 'http://http2.mlstatic.com/D_936455-MLA83298050946_042025-I.jpg', 'MLC435304', '2025-05-22T19:03:37.232Z'::timestamptz, '2026-01-21T16:34:12.158Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2902317974', 'ZMZA44469', 'Suplemento Alimenticio Adulto Mayor Essentials 50+ 60cap Sin Sabor', 21315, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2902317974-suplemento-alimenticio-adulto-mayor-essentials-50-60cap-sin-sabor-_JM', 'http://http2.mlstatic.com/D_729643-MLC89153447168_082025-I.jpg', 'MLC435304', '2025-05-26T00:38:52.731Z'::timestamptz, '2026-01-21T16:44:23.562Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2902293504', 'BRCH44623', 'Vitamina B12 Vegana 60 Capsulas - Strive Nutrition Sin Sabor', 10127, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2902293504-vitamina-b12-vegana-60-capsulas-strive-nutrition-sin-sabor-_JM', 'http://http2.mlstatic.com/D_978839-MLC85209176625_052025-I.jpg', 'MLC435304', '2025-05-26T00:56:47.422Z'::timestamptz, '2026-02-03T19:54:36.759Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1617088743', 'SCOC43674', 'Breathe Right Tiras Nasales Anti Ronquido Piel Normal 10u', 6490, 21, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1617088743-breathe-right-tiras-nasales-anti-ronquido-piel-normal-10u-_JM', 'http://http2.mlstatic.com/D_618365-MLC89079210128_082025-I.jpg', 'MLC416850', '2025-05-23T15:56:59.523Z'::timestamptz, '2026-02-03T12:35:29.826Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906271834', 'MKFA47205', 'Pack 8 Puffs Kuna Foods 10g Mix 4 Sabores (2 C/u) Sin Gluten', 5890, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906271834-pack-8-puffs-kuna-foods-10g-mix-4-sabores-2-cu-sin-gluten-_JM', 'http://http2.mlstatic.com/D_708620-MLC85154732860_052025-I.jpg', 'MLC1425', '2025-05-30T14:38:26.968Z'::timestamptz, '2026-01-21T16:44:22.944Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1617117683', 'XWEE42698', 'Fungi Pharma Extracto De Melena De León 30ml Suplemento Nutricional Vegano Sin Sabor', 13854, 52, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1617117683-fungi-pharma-extracto-de-melena-de-leon-30ml-suplemento-nutricional-vegano-sin-sabor-_JM', 'http://http2.mlstatic.com/D_680234-MLA105988000777_012026-I.jpg', 'MLC435304', '2025-05-23T16:57:29.988Z'::timestamptz, '2026-02-05T20:04:24.329Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1617148621', 'YWME43223', 'Fungi Pharma Extracto De Hongo Reishi Antioxidante Potente 30 Ml Sin Sabor', 11736, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1617148621-fungi-pharma-extracto-de-hongo-reishi-antioxidante-potente-30-ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_768604-MLA105391297882_012026-I.jpg', 'MLC435304', '2025-05-23T16:57:46.964Z'::timestamptz, '2026-02-05T15:45:03.524Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2902305588', 'QCGO44051', 'Essentials Sport Vitaminas Y Minerales 60 Cápsulas Strive Sabor N/a', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2902305588-essentials-sport-vitaminas-y-minerales-60-capsulas-strive-sabor-na-_JM', 'http://http2.mlstatic.com/D_704836-MLA84531460825_052025-I.jpg', 'MLC435304', '2025-05-26T00:22:57.984Z'::timestamptz, '2026-01-21T16:34:09.998Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2905644946', 'YMLP47267', 'B Complex B1 B2 B3 B5 B6 B9 B12 Biotina 60 Capsulas Sabor Ne Neutro', 2983, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2905644946-b-complex-b1-b2-b3-b5-b6-b9-b12-biotina-60-capsulas-sabor-ne-neutro-_JM', 'http://http2.mlstatic.com/D_956467-MLU72613035189_112023-I.jpg', 'MLC435304', '2025-05-30T01:46:40.640Z'::timestamptz, '2026-01-21T16:44:33.294Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1617064631', 'YWME43223', 'Fungi Pharma - Extracto De Hongo Reishi 30ml Sublingual Sin Sabor', 11736, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1617064631-fungi-pharma-extracto-de-hongo-reishi-30ml-sublingual-sin-sabor-_JM', 'http://http2.mlstatic.com/D_768771-MLC84825385006_052025-I.jpg', 'MLC435304', '2025-05-23T16:31:45.725Z'::timestamptz, '2026-02-05T15:45:03.523Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2902317794', 'QCGO44051', 'Strive- Essentials Sport Vitaminas Y Minerales 60cápsulas Sa N/a', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2902317794-strive-essentials-sport-vitaminas-y-minerales-60capsulas-sa-na-_JM', 'http://http2.mlstatic.com/D_704836-MLA84531460825_052025-I.jpg', 'MLC435304', '2025-05-26T00:22:57.425Z'::timestamptz, '2026-01-21T16:44:30.177Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906348734', 'BKZV47976', 'Te Hibisco Detox Vitalidad 100 Gr Blends & Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906348734-te-hibisco-detox-vitalidad-100-gr-blends-tea-_JM', 'http://http2.mlstatic.com/D_676497-MLC89976899773_082025-I.jpg', 'MLC178668', '2025-05-30T15:27:05.665Z'::timestamptz, '2026-01-26T12:45:26.772Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2902155492', 'ARDM43753', 'Cafeína En Polvo + Vitamina B6 62 Porciones Strive Sin Sabor', 21185, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2902155492-cafeina-en-polvo-vitamina-b6-62-porciones-strive-sin-sabor-_JM', 'http://http2.mlstatic.com/D_700807-MLC84908497658_052025-I.jpg', 'MLC3551', '2025-05-26T00:32:59.477Z'::timestamptz, '2026-02-05T19:33:30.854Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2902194028', 'GVDC43776', 'Omega 3 Epa 800 Dha 400 60 Cap - Strive Sin Sabor', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2902194028-omega-3-epa-800-dha-400-60-cap-strive-sin-sabor-_JM', 'http://http2.mlstatic.com/D_735825-MLC85208949549_052025-I.jpg', 'MLC435304', '2025-05-26T00:50:37.548Z'::timestamptz, '2026-01-23T15:56:55.856Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906301858', 'TVNL47159', 'Goldenmilk Tradicional 240 G Alma Golden Food - Leche Dorada', 20990, 87, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906301858-goldenmilk-tradicional-240-g-alma-golden-food-leche-dorada-_JM', 'http://http2.mlstatic.com/D_705553-MLC85458881789_052025-I.jpg', 'MLC178668', '2025-05-30T16:55:27.896Z'::timestamptz, '2026-02-05T02:17:36.962Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1616986129', 'MPQE42888', 'Mustela Hydra Bebé Leche Hidratante Corporal 300ml', 11145, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1616986129-mustela-hydra-bebe-leche-hidratante-corporal-300ml-_JM', 'http://http2.mlstatic.com/D_725436-MLU74246698111_012024-I.jpg', 'MLC44117', '2025-05-23T15:59:11.126Z'::timestamptz, '2026-01-21T16:44:20.527Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1617050221', 'MPQE42888', 'Mustela Hydra Bebé Leche Hidratante Corporal 300ml', 11145, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1617050221-mustela-hydra-bebe-leche-hidratante-corporal-300ml-_JM', 'http://http2.mlstatic.com/D_725436-MLU74246698111_012024-I.jpg', 'MLC44117', '2025-05-23T15:59:11.717Z'::timestamptz, '2026-01-21T16:49:07.998Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1617062667', 'SCOC43674', 'Breathe Right Tiras Nasales Anti Ronquido Piel Normal 10u', 6490, 21, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1617062667-breathe-right-tiras-nasales-anti-ronquido-piel-normal-10u-_JM', 'http://http2.mlstatic.com/D_608930-MLU75007209398_032024-I.jpg', 'MLC416850', '2025-05-23T15:57:00.146Z'::timestamptz, '2026-02-03T12:35:29.827Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2902130004', 'KGVC43688', 'Vitaminas Y Minerales Veganas 60 Cap Strive Vegan Essentials Sin Sabor', 19990, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2902130004-vitaminas-y-minerales-veganas-60-cap-strive-vegan-essentials-sin-sabor-_JM', 'http://http2.mlstatic.com/D_723092-MLC85209089789_052025-I.jpg', 'MLC435304', '2025-05-26T01:03:15.020Z'::timestamptz, '2026-02-03T23:10:11.444Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1616988691', 'XWEE42698', 'Fungi Pharma - Extracto De Hongo Melena De León 30ml - Sin Sabor', 13854, 52, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1616988691-fungi-pharma-extracto-de-hongo-melena-de-leon-30ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_845209-MLC89537971837_082025-I.jpg', 'MLC435304', '2025-05-23T16:43:59.140Z'::timestamptz, '2026-02-05T20:04:24.300Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2905507358', 'YMLP47267', 'B Complex B1 B2 B3 B5 B6 B9 B12 Biotina 60 Capsulas Sabor Neutro', 2983, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2905507358-b-complex-b1-b2-b3-b5-b6-b9-b12-biotina-60-capsulas-sabor-neutro-_JM', 'http://http2.mlstatic.com/D_828134-MLA97223742885_112025-I.jpg', 'MLC435304', '2025-05-30T01:46:41.227Z'::timestamptz, '2026-01-21T16:44:31.159Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906417504', 'ARDM43753', 'Cafeína En Polvo + Vitamina B6 62 Porciones Strive Sin Sabor', 21185, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906417504-cafeina-en-polvo-vitamina-b6-62-porciones-strive-sin-sabor-_JM', 'http://http2.mlstatic.com/D_660545-MLA99850898471_112025-I.jpg', 'MLC3551', '2025-05-31T15:36:57.352Z'::timestamptz, '2026-02-05T19:33:30.853Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906417334', 'KGVC43688', 'Vitaminas Y Minerales Veganas 60 Cápsulas Strive Essentials Sabor Sin Sabor', 19990, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906417334-vitaminas-y-minerales-veganas-60-capsulas-strive-essentials-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_914757-MLA99394378330_112025-I.jpg', 'MLC435304', '2025-05-31T15:27:14.485Z'::timestamptz, '2026-02-03T23:10:11.446Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1621478293', 'TXKF55328', 'Pack 10 Sobres Twopack (villano + Heroe) Superzings Serie 3', 18301, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1621478293-pack-10-sobres-twopack-villano-heroe-superzings-serie-3-_JM', 'http://http2.mlstatic.com/D_958634-MLA85464330603_052025-I.jpg', 'MLC3422', '2025-05-30T20:15:49.573Z'::timestamptz, '2026-01-21T16:44:22.353Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906181506', 'GJWQ46770', 'Auriculares Inalámbricos Hoco W35 Air 45hrs Long Usage Time Azul Acero', 13743, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906181506-auriculares-inalambricos-hoco-w35-air-45hrs-long-usage-time-azul-acero-_JM', 'http://http2.mlstatic.com/D_622947-MLU78293509685_082024-I.jpg', 'MLC5542', '2025-05-30T12:19:04.623Z'::timestamptz, '2026-01-21T16:34:10.574Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2908972996', 'ARDM48927', 'Alisado Kativa Sin Plancha Xtreme Care 150ml Reconstruye', 13085, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2908972996-alisado-kativa-sin-plancha-xtreme-care-150ml-reconstruye-_JM', 'http://http2.mlstatic.com/D_883186-MLA84552458538_052025-I.jpg', 'MLC1266', '2025-06-03T18:21:46.785Z'::timestamptz, '2026-02-04T21:05:36.151Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906268046', 'PTFZ47144', 'Power Bank Hoco 10000mah 22.5w Cargador Carga Rápida Negro Negro', 10098, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906268046-power-bank-hoco-10000mah-225w-cargador-carga-rapida-negro-negro-_JM', 'http://http2.mlstatic.com/D_996737-MLA79450978200_102024-I.jpg', 'MLC157684', '2025-05-30T12:22:17.224Z'::timestamptz, '2026-01-21T16:34:15.701Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906417482', 'ZMZA44469', 'Suplemento Alimenticio Adulto Mayor Essentials 50+ 60cap Sin Sabor', 21315, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906417482-suplemento-alimenticio-adulto-mayor-essentials-50-60cap-sin-sabor-_JM', 'http://http2.mlstatic.com/D_748244-MLA99474141554_112025-I.jpg', 'MLC435304', '2025-05-31T15:35:50.241Z'::timestamptz, '2026-01-21T16:44:25.328Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906155236', 'XPLU46696', 'Telefono Senior Mlab 9204 Shell 4g Sos 2.8 Pulgadas Negro', 42220, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906155236-telefono-senior-mlab-9204-shell-4g-sos-28-pulgadas-negro-_JM', 'http://http2.mlstatic.com/D_644495-MLA99454392956_112025-I.jpg', 'MLC1055', '2025-05-30T12:25:20.662Z'::timestamptz, '2026-01-21T16:44:19.088Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1621331327', 'PTFZ47144', 'Power Bank Hoco 10000mah 22.5w Cargador Carga Rápida Negro', 10098, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1621331327-power-bank-hoco-10000mah-225w-cargador-carga-rapida-negro-_JM', 'http://http2.mlstatic.com/D_756111-MLA99450904118_112025-I.jpg', 'MLC157684', '2025-05-30T12:22:17.740Z'::timestamptz, '2026-01-21T16:44:33.562Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906248372', 'KGJR48524', 'Golden Milk 100 Gr Blends & Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906248372-golden-milk-100-gr-blends-tea-_JM', 'http://http2.mlstatic.com/D_913070-MLC85539965408_062025-I.jpg', 'MLC178668', '2025-05-30T15:41:16.327Z'::timestamptz, '2026-01-21T16:34:09.233Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906168418', 'GJWQ46770', 'Auriculares Inalámbricos Hoco W35 Air 45hrs Long Usage Time Color Azul Acero', 13743, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906168418-auriculares-inalambricos-hoco-w35-air-45hrs-long-usage-time-color-azul-acero-_JM', 'http://http2.mlstatic.com/D_789785-MLA99956777649_112025-I.jpg', 'MLC5542', '2025-05-30T12:19:05.176Z'::timestamptz, '2026-01-21T16:44:34.121Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2909049512', 'LYSO53159', 'Vitamina C Liposomal Calidad Premium X 90 Capsulas Vegetales Sabor Sin Sabor', 13990, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2909049512-vitamina-c-liposomal-calidad-premium-x-90-capsulas-vegetales-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_794464-MLA99938389711_112025-I.jpg', 'MLC435304', '2025-06-03T21:13:22.978Z'::timestamptz, '2026-02-05T22:12:26.137Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906417538', 'GVDC43776', 'Omega 3 Strive Nutrition - 60 Cápsulas Blandas Sabor Sin Sabor', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906417538-omega-3-strive-nutrition-60-capsulas-blandas-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_898893-MLA99473947480_112025-I.jpg', 'MLC435304', '2025-05-31T15:38:36.261Z'::timestamptz, '2026-01-23T15:56:55.845Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2908960908', 'KDKE48989', 'Kativa Argan Oil Serum Reparador Brillo Cabello Seco X 60ml', 4849, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2908960908-kativa-argan-oil-serum-reparador-brillo-cabello-seco-x-60ml-_JM', 'http://http2.mlstatic.com/D_740930-MLA84844887141_052025-I.jpg', 'MLC1266', '2025-06-03T18:17:10.610Z'::timestamptz, '2026-01-21T16:44:29.677Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2909023670', 'QFQS52678', 'Betarraga Pura 500 Mg 90 Caps Promueve Oxido Nitroso Lp Sabo Sin Sabor', 9600, 13, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2909023670-betarraga-pura-500-mg-90-caps-promueve-oxido-nitroso-lp-sabo-sin-sabor-_JM', 'http://http2.mlstatic.com/D_935897-MLA80821139702_122024-I.jpg', 'MLC435304', '2025-06-03T21:11:58.360Z'::timestamptz, '2026-02-05T15:30:43.773Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2908954318', 'SJHN49540', 'Shampoo Kativa Coconut 355 Ml', 6950, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2908954318-shampoo-kativa-coconut-355-ml-_JM', 'http://http2.mlstatic.com/D_691501-MLA84551631082_052025-I.jpg', 'MLC8163', '2025-06-03T18:26:03.076Z'::timestamptz, '2026-01-21T16:44:23.358Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2909062362', 'LYSO53159', 'Vitamina C Liposomal Calidad Premium X 90 Capsulas Vegetales - Sin Sabor', 13990, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2909062362-vitamina-c-liposomal-calidad-premium-x-90-capsulas-vegetales-sin-sabor-_JM', 'http://http2.mlstatic.com/D_851355-MLU73967056236_012024-I.jpg', 'MLC435304', '2025-06-03T21:13:22.373Z'::timestamptz, '2026-02-05T22:12:26.119Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906039788', 'BRCH44623', 'Vitamina B12 Vegana 60 Capsulas - Strive Nutrition Sin Sabor', 10127, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906039788-vitamina-b12-vegana-60-capsulas-strive-nutrition-sin-sabor-_JM', 'http://http2.mlstatic.com/D_602159-MLA99513158434_112025-I.jpg', 'MLC435304', '2025-05-31T14:57:56.821Z'::timestamptz, '2026-02-03T19:54:34.214Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2908954280', 'FCOM48873', 'Cepillo Para Cabello Wetbrush Shine Enhacer Desenredante Color Violeta', 11050, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2908954280-cepillo-para-cabello-wetbrush-shine-enhacer-desenredante-color-violeta-_JM', 'http://http2.mlstatic.com/D_881556-MLU74143252849_012024-I.jpg', 'MLC180894', '2025-06-03T18:23:41.904Z'::timestamptz, '2026-01-21T16:34:13.253Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2908976794', 'SMRL21095', 'Pack Citrato De Magnesio + Cit. Potasio (polvo 300 Grs.) Sabor Sin Sabor', 9990, 39, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2908976794-pack-citrato-de-magnesio-cit-potasio-polvo-300-grs-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_798426-MLA99453304258_112025-I.jpg', 'MLC3551', '2025-06-03T21:09:12.202Z'::timestamptz, '2026-02-05T15:07:16.559Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2908930024', 'PJAG49230', 'Protector Térmico 12 Beneficios Brillo Reparación Kativa Cvl', 5399, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2908930024-protector-termico-12-beneficios-brillo-reparacion-kativa-cvl-_JM', 'http://http2.mlstatic.com/D_860811-MLC90725424373_082025-I.jpg', 'MLC1266', '2025-06-03T18:20:07.390Z'::timestamptz, '2026-01-21T16:44:16.326Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623107989', 'CHGY48272', 'Kit Tratamiento Reconstrucción Capilar Kativa Total Plex', 11676, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623107989-kit-tratamiento-reconstruccion-capilar-kativa-total-plex-_JM', 'http://http2.mlstatic.com/D_630184-MLC89735887922_082025-I.jpg', 'MLC1266', '2025-06-03T18:20:56.134Z'::timestamptz, '2026-01-21T16:44:34.053Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623120763', 'OLHY48856', 'Just For Men Control Gradual Negro T-55 Moreno-negro', 10957, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623120763-just-for-men-control-gradual-negro-t-55-moreno-negro-_JM', 'http://http2.mlstatic.com/D_946422-MLA84857984735_052025-I.jpg', 'MLC174669', '2025-06-03T18:13:59.147Z'::timestamptz, '2026-01-29T11:01:11.300Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623095351', 'SJHN49540', 'Shampoo Kativa Coconut 355 Ml', 6950, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623095351-shampoo-kativa-coconut-355-ml-_JM', 'http://http2.mlstatic.com/D_939134-MLA99414582858_112025-I.jpg', 'MLC8163', '2025-06-03T18:26:03.681Z'::timestamptz, '2026-01-21T16:44:25.722Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623120909', 'CHGY48272', 'Kit Tratamiento Reconstrucción Capilar Kativa Total Plex', 11676, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623120909-kit-tratamiento-reconstruccion-capilar-kativa-total-plex-_JM', 'http://http2.mlstatic.com/D_809243-MLA99892774511_112025-I.jpg', 'MLC1266', '2025-06-03T18:20:56.725Z'::timestamptz, '2026-01-21T16:34:12.266Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623095101', 'ORGZ50333', 'Protectores Diarios Organyc Organica Con Envoltorio Regular 24 u', 5490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623095101-protectores-diarios-organyc-organica-con-envoltorio-regular-24u-_JM', 'http://http2.mlstatic.com/D_914656-MLA99881823533_112025-I.jpg', 'MLC409598', '2025-06-03T18:15:14.613Z'::timestamptz, '2026-02-02T14:01:47.410Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623156171', 'QFQS52678', 'Betarraga Pura 500 Mg 90 Caps Promueve Oxido Nitroso Lp Sabor Sin Sabor', 9600, 13, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623156171-betarraga-pura-500-mg-90-caps-promueve-oxido-nitroso-lp-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_696275-MLA99969853983_112025-I.jpg', 'MLC435304', '2025-06-03T21:11:58.977Z'::timestamptz, '2026-02-05T15:30:43.767Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623167023', 'LHDC96785', 'Creatina Monohidrato Pura 1 K. Zeo Sport. 200 Mesh. Premium Sabor Sin Sabor', 28120, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623167023-creatina-monohidrato-pura-1-k-zeo-sport-200-mesh-premium-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_934738-MLA100081300867_122025-I.jpg', 'MLC435304', '2025-06-03T21:05:41.942Z'::timestamptz, '2026-02-03T00:18:53.530Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623108121', 'KEAH48785', 'Mustela Agua Limpiadora En Seco 300 Ml', 6490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623108121-mustela-agua-limpiadora-en-seco-300-ml-_JM', 'http://http2.mlstatic.com/D_830105-MLC85508978000_062025-I.jpg', 'MLC418673', '2025-06-03T18:27:53.501Z'::timestamptz, '2026-01-31T02:04:50.029Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623095205', 'PJAG49230', 'Protector Térmico 12 Beneficios Brillo Reparación Kativa Cvl', 5399, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623095205-protector-termico-12-beneficios-brillo-reparacion-kativa-cvl-_JM', 'http://http2.mlstatic.com/D_939489-MLA99373442002_112025-I.jpg', 'MLC1266', '2025-06-03T18:20:07.945Z'::timestamptz, '2026-01-21T16:44:26.631Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623120933', 'ARDM48927', 'Alisado Kativa Sin Plancha Xtreme Care 150ml Reconstruye', 13085, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623120933-alisado-kativa-sin-plancha-xtreme-care-150ml-reconstruye-_JM', 'http://http2.mlstatic.com/D_911692-MLA99853840461_112025-I.jpg', 'MLC1266', '2025-06-03T18:21:47.440Z'::timestamptz, '2026-02-04T21:05:36.186Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623120955', 'QJHI49834', 'Dermo Vagisil Jabón Líquido Odor Block 354ml', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623120955-dermo-vagisil-jabon-liquido-odor-block-354ml-_JM', 'http://http2.mlstatic.com/D_866656-MLA99897190803_112025-I.jpg', 'MLC453571', '2025-06-03T18:22:58.963Z'::timestamptz, '2026-01-31T02:19:25.674Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623058243', 'FCOM48873', 'Cepillo Para Cabello Wetbrush Shine Enhacer Desenredante Col Violeta', 11050, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623058243-cepillo-para-cabello-wetbrush-shine-enhacer-desenredante-col-violeta-_JM', 'http://http2.mlstatic.com/D_881556-MLU74143252849_012024-I.jpg', 'MLC180894', '2025-06-03T18:23:41.295Z'::timestamptz, '2026-01-21T16:44:28.785Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623137477', 'KKTU22224', 'Citrato De Magnesio Puro  En Polvo X 300 Gramos Sabor Sin Sa Sin Sabor', 10991, 39, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623137477-citrato-de-magnesio-puro-en-polvo-x-300-gramos-sabor-sin-sa-sin-sabor-_JM', 'http://http2.mlstatic.com/D_826802-MLU71306219672_082023-I.jpg', 'MLC435304', '2025-06-03T21:03:45.099Z'::timestamptz, '2026-02-06T00:53:28.777Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623083335', 'ORGZ50333', 'Organyc Protector Diario Envoltorio 24 Unidades', 5490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623083335-organyc-protector-diario-envoltorio-24-unidades-_JM', 'http://http2.mlstatic.com/D_857549-MLA82049020643_012025-I.jpg', 'MLC409598', '2025-06-03T18:15:14.081Z'::timestamptz, '2026-02-02T14:02:02.803Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623133639', 'CBNX49847', 'Mustela Shampoo Suave 200 Ml', 6490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623133639-mustela-shampoo-suave-200-ml-_JM', 'http://http2.mlstatic.com/D_885739-MLA99411379434_112025-I.jpg', 'MLC418404', '2025-06-03T18:18:58.371Z'::timestamptz, '2026-01-30T13:18:22.385Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623083375', 'KDKE48989', 'Kativa Argan Oil Serum Reparador Brillo Cabello Seco X 60ml', 4849, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623083375-kativa-argan-oil-serum-reparador-brillo-cabello-seco-x-60ml-_JM', 'http://http2.mlstatic.com/D_623595-MLA99858459307_112025-I.jpg', 'MLC1266', '2025-06-03T18:17:11.210Z'::timestamptz, '2026-01-21T16:34:10.659Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623167021', 'LHDC96785', 'Creatina Monohidrato Pura 1 K. Zeo Sport. 200 Mesh. Premium Sin Sabor', 28120, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623167021-creatina-monohidrato-pura-1-k-zeo-sport-200-mesh-premium-sin-sabor-_JM', 'http://http2.mlstatic.com/D_839147-MLU75942538596_052024-I.jpg', 'MLC435304', '2025-06-03T21:05:41.351Z'::timestamptz, '2026-02-03T00:18:53.545Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623099049', 'KKTU22224', 'Citrato De Magnesio Puro En Polvo X 300 Gramos Sabor Sin Sabor', 10991, 39, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623099049-citrato-de-magnesio-puro-en-polvo-x-300-gramos-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_739867-MLA99413639932_112025-I.jpg', 'MLC435304', '2025-06-03T21:03:45.723Z'::timestamptz, '2026-02-06T00:53:28.774Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1623083477', 'QJHI49834', 'Dermo Vagisil Jabón Líquido Odor Block 354ml', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1623083477-dermo-vagisil-jabon-liquido-odor-block-354ml-_JM', 'http://http2.mlstatic.com/D_744824-MLU75593658853_042024-I.jpg', 'MLC453571', '2025-06-03T18:22:58.377Z'::timestamptz, '2026-01-31T02:19:25.678Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934878026', 'MVDX62979', 'Multivitaminas + Biotina Efervescente German Energy X 3 Unid Sabor Naranja', 5394, 3, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2934878026-multivitaminas-biotina-efervescente-german-energy-x-3-unid-sabor-naranja-_JM', 'http://http2.mlstatic.com/D_700556-MLA99016958306_112025-I.jpg', 'MLC435304', '2025-06-22T19:45:02.598Z'::timestamptz, '2026-01-21T16:44:19.255Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2912910014', 'TVNL47159', 'Golden Milk Alma Golden Food En Polvo 240g Sin Azúcar Vegano', 20990, 87, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2912910014-golden-milk-alma-golden-food-en-polvo-240g-sin-azucar-vegano-_JM', 'http://http2.mlstatic.com/D_963059-MLA99927124069_112025-I.jpg', 'MLC178668', '2025-06-09T03:46:53.943Z'::timestamptz, '2026-02-05T02:17:36.962Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2914725726', 'BTWM56227', 'Audifonos Bluetooth Tws Hoco Ew45 Gato Compatible iPhone Col Negro', 11300, 16, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2914725726-audifonos-bluetooth-tws-hoco-ew45-gato-compatible-iphone-col-negro-_JM', 'http://http2.mlstatic.com/D_747131-MLU72612670211_112023-I.jpg', 'MLC5542', '2025-06-10T16:21:44.020Z'::timestamptz, '2026-02-04T23:17:20.712Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934865086', 'NKWH64997', 'Vitamina C 1000 Mg Efervescente 20 Tabletas German Energy Sa Naranja', 2163, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2934865086-vitamina-c-1000-mg-efervescente-20-tabletas-german-energy-sa-naranja-_JM', 'http://http2.mlstatic.com/D_983007-MLU74836983778_032024-I.jpg', 'MLC435304', '2025-06-22T19:41:28.023Z'::timestamptz, '2026-01-21T16:44:28.099Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934968888', 'DLGV64059', 'Vitamina C + Zinc Efervescente X 20 German Energy Sabor Nara Naranja', 3200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2934968888-vitamina-c-zinc-efervescente-x-20-german-energy-sabor-nara-naranja-_JM', 'http://http2.mlstatic.com/D_790654-MLA85717533338_062025-I.jpg', 'MLC435304', '2025-06-22T19:43:05.257Z'::timestamptz, '2026-01-21T16:44:15.309Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934878074', 'SCOC63034', 'Pre Entreno Xtreme Boost Tubo 20 Tabletas Sabor Guaraná', 5990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2934878074-pre-entreno-xtreme-boost-tubo-20-tabletas-sabor-guarana-_JM', 'http://http2.mlstatic.com/D_934750-MLA104118383226_012026-I.jpg', 'MLC435304', '2025-06-22T19:47:03.631Z'::timestamptz, '2026-01-21T16:34:12.683Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2915223008', 'MGNC53924', 'Preservativo Sin Latex Lifestyles Skyn Large - 3 Unidades', 3950, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2915223008-preservativo-sin-latex-lifestyles-skyn-large-3-unidades-_JM', 'http://http2.mlstatic.com/D_890977-MLC51150132370_082022-I.jpg', 'MLC174813', '2025-06-11T01:05:20.205Z'::timestamptz, '2026-01-21T16:49:08.454Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1622916875', 'CBNX49847', 'Mustela Shampoo Suave 200 Ml', 6490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1622916875-mustela-shampoo-suave-200-ml-_JM', 'http://http2.mlstatic.com/D_724312-MLU74111556813_012024-I.jpg', 'MLC418404', '2025-06-03T18:18:57.749Z'::timestamptz, '2026-01-30T13:18:22.369Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2915043526', 'BTWM56227', 'Audífonos Inalámbricos Con Funda De Gato Hoco Ew45 Negro', 11300, 16, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2915043526-audifonos-inalambricos-con-funda-de-gato-hoco-ew45-negro-_JM', 'http://http2.mlstatic.com/D_660991-MLA100260227401_122025-I.jpg', 'MLC5542', '2025-06-10T16:21:44.586Z'::timestamptz, '2026-02-04T23:17:20.719Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1626630879', 'DFCK53088', 'Vitamina C Pura (premium) 3 Meses Linea Premium Vegana Sabor Sin Sabor', 6500, 27, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1626630879-vitamina-c-pura-premium-3-meses-linea-premium-vegana-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_953506-MLA99599819952_122025-I.jpg', 'MLC3551', '2025-06-11T00:38:07.944Z'::timestamptz, '2026-02-04T12:18:17.665Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1626756093', 'DFCK53088', 'Vitamina C Pura (premium) 3 Meses Linea Premium Vegana Sabor Sin Sabor', 6500, 27, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1626756093-vitamina-c-pura-premium-3-meses-linea-premium-vegana-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_656851-MLA81894401021_012025-I.jpg', 'MLC3551', '2025-06-11T00:38:07.343Z'::timestamptz, '2026-02-03T03:17:05.580Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2915031158', NULL, 'Batería Externa Power Bank 20000 Mah 22.5w Pd Master-g', 19980, 0, 'paused', 'self_service', 'https://articulo.mercadolibre.cl/MLC-2915031158-bateria-externa-power-bank-20000-mah-225w-pd-master-g-_JM', 'http://http2.mlstatic.com/D_814651-MLU78068080927_072024-I.jpg', 'MLC5068', '2025-06-10T16:25:56.971Z'::timestamptz, '2026-01-21T16:44:23.351Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1622981513', 'OLHY48856', 'Just For Men Control Gradual Negro', 10957, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1622981513-just-for-men-control-gradual-negro-_JM', 'http://http2.mlstatic.com/D_919719-MLA99510836438_112025-I.jpg', 'MLC174669', '2025-06-03T18:13:59.749Z'::timestamptz, '2026-01-29T11:01:16.870Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2915327008', 'MGNC53924', 'Preservativo Sin Latex Lifestyles Skyn Large - 3 Unidades', 3950, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2915327008-preservativo-sin-latex-lifestyles-skyn-large-3-unidades-_JM', 'http://http2.mlstatic.com/D_690960-MLA97224412599_112025-I.jpg', 'MLC174813', '2025-06-11T01:05:20.740Z'::timestamptz, '2026-01-21T16:44:28.545Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934865872', 'LBRU63355', 'Charqui De Wagyu La Loberia 40 Grs Charqui De Wayu', 5990, 106, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2934865872-charqui-de-wagyu-la-loberia-40-grs-charqui-de-wayu-_JM', 'http://http2.mlstatic.com/D_914327-MLC96502040369_102025-I.jpg', 'MLC1429', '2025-06-22T20:39:32.203Z'::timestamptz, '2026-02-06T01:02:19.613Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1622955543', NULL, 'Limpiador Antigrasa Frosch Pomelo 500ml Gatillo Para Cocina Hornos Parrillas', 4200, 5, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1622955543-limpiador-antigrasa-frosch-pomelo-500ml-gatillo-para-cocina-hornos-parrillas-_JM', 'http://http2.mlstatic.com/D_951691-MLA99345257994_112025-I.jpg', 'MLC440243', '2025-06-03T18:18:11.154Z'::timestamptz, '2026-01-28T16:46:17.077Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2914929332', NULL, 'Batería Externa Power Bank 20000 Mah 22.5w Power Delivery Master-g Color Azul', 19980, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2914929332-bateria-externa-power-bank-20000-mah-225w-power-delivery-master-g-color-azul-_JM', 'http://http2.mlstatic.com/D_772202-MLA96870864139_102025-I.jpg', 'MLC5068', '2025-06-10T16:25:57.504Z'::timestamptz, '2026-01-21T16:34:09.667Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2935063826', NULL, 'Lustra Mueble Líquido Frosch Aseo Ecológico', 6290, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2935063826-lustra-mueble-liquido-frosch-aseo-ecologico-_JM', 'http://http2.mlstatic.com/D_666465-MLA99831731677_112025-I.jpg', 'MLC440242', '2025-06-22T21:37:27.814Z'::timestamptz, '2026-01-21T16:34:14.627Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2928522652', 'UITQ30585', 'Set Jarra Y 6 Vasos Conjunto Jarra 2 Litros 6 Vasos Vidrio Color Transparente', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2928522652-set-jarra-y-6-vasos-conjunto-jarra-2-litros-6-vasos-vidrio-color-transparente-_JM', 'http://http2.mlstatic.com/D_905974-MLA95736212750_102025-I.jpg', 'MLC179055', '2025-06-17T23:36:47.922Z'::timestamptz, '2026-01-21T16:44:20.251Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2914842624', 'NISH59537', 'Batería Externa Power Bank 10000 Mah 22.5w Powerdelivery Master-g Color Azul', 14980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2914842624-bateria-externa-power-bank-10000-mah-225w-powerdelivery-master-g-color-azul-_JM', 'http://http2.mlstatic.com/D_666614-MLA95635550626_102025-I.jpg', 'MLC157684', '2025-06-10T16:18:50.549Z'::timestamptz, '2026-01-21T16:44:21.577Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632042297', 'VQUB64731', 'Aceite Tratamiento Kativa Keratina 60 Ml', 5810, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1632042297-aceite-tratamiento-kativa-keratina-60-ml-_JM', 'http://http2.mlstatic.com/D_904073-MLA99371903090_112025-I.jpg', 'MLC1266', '2025-06-22T21:39:28.240Z'::timestamptz, '2026-01-21T16:34:15.473Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632123637', NULL, 'Lustra Mueble Líquido Frosch Aseo Ecológico', 6290, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1632123637-lustra-mueble-liquido-frosch-aseo-ecologico-_JM', 'http://http2.mlstatic.com/D_921107-MLC74129733811_012024-I.jpg', 'MLC440242', '2025-06-22T21:37:27.177Z'::timestamptz, '2026-01-21T16:44:22.343Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934852156', 'DLGV64059', 'Vitamina C + Zinc Efervescente X 20 German Energy Sabor Naranja', 3200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2934852156-vitamina-c-zinc-efervescente-x-20-german-energy-sabor-naranja-_JM', 'http://http2.mlstatic.com/D_797612-MLA97974620311_112025-I.jpg', 'MLC435304', '2025-06-22T19:43:05.820Z'::timestamptz, '2026-01-21T16:44:35.189Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2936400616', 'JTQV67151', 'Endulzante Líquido Naturalist Stevia Y Sucralosa 450 Ml', 4104, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2936400616-endulzante-liquido-naturalist-stevia-y-sucralosa-450-ml-_JM', 'http://http2.mlstatic.com/D_860469-MLA94901687479_102025-I.jpg', 'MLC413215', '2025-06-23T17:23:11.658Z'::timestamptz, '2026-01-21T16:44:25.995Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632040883', 'DBIQ62659', 'Bioplus Probioticos Multivitaminico Tab Efervescentes X 20 Naranja', 5053, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1632040883-bioplus-probioticos-multivitaminico-tab-efervescentes-x-20-naranja-_JM', 'http://http2.mlstatic.com/D_624263-MLA102284345951_122025-I.jpg', 'MLC435304', '2025-06-22T19:48:35.718Z'::timestamptz, '2026-01-21T16:44:17.112Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2936005026', 'JTQV67151', 'Endulzante Líquido Naturalist Stevia Y Sucralosa 450 Ml', 4104, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2936005026-endulzante-liquido-naturalist-stevia-y-sucralosa-450-ml-_JM', 'http://http2.mlstatic.com/D_699959-MLU78922549809_092024-I.jpg', 'MLC413215', '2025-06-23T17:23:11.061Z'::timestamptz, '2026-01-21T16:34:11.389Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943577026', 'CYGP64419', 'Power Bank Hoco J101b 30.000 Mah 22.5w Fast Charge Color Neg Negro', 25580, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943577026-power-bank-hoco-j101b-30000-mah-225w-fast-charge-color-neg-negro-_JM', 'http://http2.mlstatic.com/D_866434-MLA81447332381_122024-I.jpg', 'MLC157684', '2025-06-28T02:54:12.860Z'::timestamptz, '2026-01-21T16:44:20.275Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632201247', 'XIXB63816', 'Kativa Coconut Oil Serum Reparador Brillo Pelo Dañado X 60ml', 4952, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1632201247-kativa-coconut-oil-serum-reparador-brillo-pelo-danado-x-60ml-_JM', 'http://http2.mlstatic.com/D_737600-MLA43847620410_102020-I.jpg', 'MLC1266', '2025-06-22T21:33:22.231Z'::timestamptz, '2026-01-21T16:34:10.481Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2938085790', 'ZEAO62525', 'Golden Milk 200 Gr Blends & Tea', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2938085790-golden-milk-200-gr-blends-tea-_JM', 'http://http2.mlstatic.com/D_913070-MLC85539965408_062025-I.jpg', 'MLC178668', '2025-06-26T02:41:14.963Z'::timestamptz, '2026-01-21T16:49:08.447Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632188237', 'XIXB63816', 'Aceite Coconut Kativa 60ml Nutrición + Brillo', 4952, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1632188237-aceite-coconut-kativa-60ml-nutricion-brillo-_JM', 'http://http2.mlstatic.com/D_671342-MLA99855623817_112025-I.jpg', 'MLC1266', '2025-06-22T21:33:22.763Z'::timestamptz, '2026-01-21T16:44:32.506Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934852242', 'SCOC63034', 'Pre Entreno Xtreme Boost Tubo 20 Tabletas Sabor Guaraná Guaraná', 5990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2934852242-pre-entreno-xtreme-boost-tubo-20-tabletas-sabor-guarana-guarana-_JM', 'http://http2.mlstatic.com/D_867044-MLA84483991395_052025-I.jpg', 'MLC435304', '2025-06-22T19:47:03.051Z'::timestamptz, '2026-01-21T16:44:25.278Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943784068', NULL, 'Kativa Hyaluronic Acondicionador Hidratación Profunda Vegano', 6331, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2943784068-kativa-hyaluronic-acondicionador-hidratacion-profunda-vegano-_JM', 'http://http2.mlstatic.com/D_654068-MLA84834769843_052025-I.jpg', 'MLC8163', '2025-06-28T00:59:39.347Z'::timestamptz, '2026-01-21T16:34:09.013Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2937023856', 'RTKG61388', 'Crema Mustela Bebé Vitamina', 5690, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2937023856-crema-mustela-bebe-vitamina-_JM', 'http://http2.mlstatic.com/D_966936-MLA99372695614_112025-I.jpg', 'MLC418673', '2025-06-24T16:26:20.098Z'::timestamptz, '2026-02-02T02:52:26.062Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2934826290', 'MVDX62979', 'Multivitaminas + Biotina Efervescente German Energy X 3 Unid Naranja', 5394, 3, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2934826290-multivitaminas-biotina-efervescente-german-energy-x-3-unid-naranja-_JM', 'http://http2.mlstatic.com/D_750909-MLA84475329003_052025-I.jpg', 'MLC435304', '2025-06-22T19:45:02.003Z'::timestamptz, '2026-01-21T16:44:30.138Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943641728', 'LQQM64670', 'Audifonos Para iPhone Lightning Con Microfono - Hoco Color Blanco Luz Blanco', 9695, 71, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943641728-audifonos-para-iphone-lightning-con-microfono-hoco-color-blanco-luz-blanco-_JM', 'http://http2.mlstatic.com/D_704785-MLA99906413959_112025-I.jpg', 'MLC3697', '2025-06-28T02:57:49.637Z'::timestamptz, '2026-02-05T21:01:12.909Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943577034', 'LQQM64670', 'Audifonos Para iPhone Lightning Con Microfono - Hoco Color B Blanco', 9695, 71, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943577034-audifonos-para-iphone-lightning-con-microfono-hoco-color-b-blanco-_JM', 'http://http2.mlstatic.com/D_757383-MLU78834505231_082024-I.jpg', 'MLC3697', '2025-06-28T02:57:49.132Z'::timestamptz, '2026-02-05T20:41:35.004Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632071979', 'VQUB64731', 'Aceite Tratamiento Kativa Keratina 60 Ml', 5810, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1632071979-aceite-tratamiento-kativa-keratina-60-ml-_JM', 'http://http2.mlstatic.com/D_859919-MLA84840174039_052025-I.jpg', 'MLC1266', '2025-06-22T21:39:27.683Z'::timestamptz, '2026-01-21T16:44:29.775Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632040881', 'DBIQ62659', 'Bioplus Probioticos Multivitaminico Tab Efervescentes X 20 Naranja', 5053, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1632040881-bioplus-probioticos-multivitaminico-tab-efervescentes-x-20-naranja-_JM', 'http://http2.mlstatic.com/D_793332-MLA84472253051_052025-I.jpg', 'MLC435304', '2025-06-22T19:48:35.165Z'::timestamptz, '2026-01-21T16:44:28.991Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1632040755', 'NKWH64997', 'Vitamina C 1000 Mg Efervescente 20 Tabletas German Energy Sabor Naranja', 2163, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1632040755-vitamina-c-1000-mg-efervescente-20-tabletas-german-energy-sabor-naranja-_JM', 'http://http2.mlstatic.com/D_903821-MLA104778148266_012026-I.jpg', 'MLC435304', '2025-06-22T19:41:28.604Z'::timestamptz, '2026-01-23T21:54:19.514Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2937484970', 'RTKG61388', 'Crema Antirozaduras 50 Ml Mustela Bebé Vitamina', 5690, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2937484970-crema-antirozaduras-50-ml-mustela-bebe-vitamina-_JM', 'http://http2.mlstatic.com/D_614682-MLA84474115727_052025-I.jpg', 'MLC418673', '2025-06-24T16:26:19.578Z'::timestamptz, '2026-02-02T02:52:27.038Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942381276', 'USAY65949', 'Lifestyles Preservativos Studded-rough Rider X 21', 12322, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942381276-lifestyles-preservativos-studded-rough-rider-x-21-_JM', 'http://http2.mlstatic.com/D_735397-MLU78561488405_082024-I.jpg', 'MLC174813', '2025-06-27T17:02:16.981Z'::timestamptz, '2026-01-21T16:34:33.414Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943201298', 'CYGP64419', 'Power Bank Hoco J101b 30.000 Mah 22.5w Fast Charge Color Negro', 25580, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943201298-power-bank-hoco-j101b-30000-mah-225w-fast-charge-color-negro-_JM', 'http://http2.mlstatic.com/D_844778-MLA100868518563_122025-I.jpg', 'MLC157684', '2025-06-28T02:54:13.407Z'::timestamptz, '2026-01-21T16:44:23.692Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943110254', 'XLRM63496', 'Acondicionador Kativa Reconstrucción Coconut X355ml', 5859, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943110254-acondicionador-kativa-reconstruccion-coconut-x355ml-_JM', 'http://http2.mlstatic.com/D_859166-MLA84851322887_052025-I.jpg', 'MLC8163', '2025-06-28T02:04:43.197Z'::timestamptz, '2026-01-21T16:34:12.399Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942238238', 'BRCH65657', 'Preservativos Condones Lifestyles X15un Skyn Feel Sin Látex', 14102, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942238238-preservativos-condones-lifestyles-x15un-skyn-feel-sin-latex-_JM', 'http://http2.mlstatic.com/D_625100-MLA99930086849_112025-I.jpg', 'MLC174813', '2025-06-27T17:00:58.064Z'::timestamptz, '2026-01-21T16:34:20.132Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942394250', 'VFWF64966', 'Endulzante Líquido Naturalist Stevia Y Sucralosa 270 Ml', 2128, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942394250-endulzante-liquido-naturalist-stevia-y-sucralosa-270-ml-_JM', 'http://http2.mlstatic.com/D_860367-MLA84540261718_052025-I.jpg', 'MLC413215', '2025-06-27T17:05:50.331Z'::timestamptz, '2026-01-21T16:34:29.174Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942238308', NULL, 'Gel Hidratante Clinic Acido Hialurónico Bentley 50gr Neutro', 5990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2942238308-gel-hidratante-clinic-acido-hialuronico-bentley-50gr-neutro-_JM', 'http://http2.mlstatic.com/D_899197-MLA103926362236_012026-I.jpg', 'MLC400500', '2025-06-27T17:16:25.025Z'::timestamptz, '2026-01-21T16:44:31.072Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942355276', NULL, 'Gel Hidratante Clinic Acido Hialurónico Bentley 50gr Neutro', 5990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2942355276-gel-hidratante-clinic-acido-hialuronico-bentley-50gr-neutro-_JM', 'http://http2.mlstatic.com/D_898451-MLA84180786134_052025-I.jpg', 'MLC400500', '2025-06-27T17:16:24.465Z'::timestamptz, '2026-01-21T16:34:10.920Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943199608', 'QCAR66768', 'Preservativo Orgazmax Con Textura & Retardante 3 Und', 2841, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943199608-preservativo-orgazmax-con-textura-retardante-3-und-_JM', 'http://http2.mlstatic.com/D_631583-MLA99854893781_112025-I.jpg', 'MLC174813', '2025-06-27T17:07:34.635Z'::timestamptz, '2026-01-21T16:34:12.737Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942290138', 'QCAR66768', 'Preservativo Orgazmax Con Textura & Retardante 3 Und', 2841, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942290138-preservativo-orgazmax-con-textura-retardante-3-und-_JM', 'http://http2.mlstatic.com/D_899503-MLC51554788796_092022-I.jpg', 'MLC174813', '2025-06-27T17:07:34.123Z'::timestamptz, '2026-01-21T16:44:25.510Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943201012', 'XJTD63598', 'Toallitas Compactadas Organyc Baby Care Algodon 100% Organico 60 Unidades', 6065, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943201012-toallitas-compactadas-organyc-baby-care-algodon-100-organico-60-unidades-_JM', 'http://http2.mlstatic.com/D_643973-MLA99860020099_112025-I.jpg', 'MLC418676', '2025-06-28T00:53:17.286Z'::timestamptz, '2026-02-02T14:09:22.116Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942382684', 'LQKN63918', 'Kativa Crema Coconut 300ml - Ml', 6500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942382684-kativa-crema-coconut-300ml-ml-_JM', 'http://http2.mlstatic.com/D_888791-MLA84856338049_052025-I.jpg', 'MLC1266', '2025-06-28T00:58:45.987Z'::timestamptz, '2026-01-21T16:34:09.150Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942239634', NULL, 'Kativa Hyaluronic Shampoo Hidratación Profunda Vegano Pelo', 7990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2942239634-kativa-hyaluronic-shampoo-hidratacion-profunda-vegano-pelo-_JM', 'http://http2.mlstatic.com/D_916669-MLA99857182959_112025-I.jpg', 'MLC8163', '2025-06-28T00:56:11.563Z'::timestamptz, '2026-01-21T16:44:28.113Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942355196', 'USAY65949', 'Lifestyles Preservativos Studded-rough Rider X 21', 12322, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942355196-lifestyles-preservativos-studded-rough-rider-x-21-_JM', 'http://http2.mlstatic.com/D_600457-MLA99431531244_112025-I.jpg', 'MLC174813', '2025-06-27T17:02:17.499Z'::timestamptz, '2026-01-21T16:34:33.664Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942407268', 'VFWF64966', 'Endulzante Líquido Naturalist Stevia Y Sucralosa 270 Ml', 2128, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942407268-endulzante-liquido-naturalist-stevia-y-sucralosa-270-ml-_JM', 'http://http2.mlstatic.com/D_905332-MLA99423139440_112025-I.jpg', 'MLC413215', '2025-06-27T17:05:50.820Z'::timestamptz, '2026-01-21T16:44:29.552Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943498966', NULL, 'Kativa Hyaluronic Shampoo Hidratación Profunda Vegano Pelo', 7990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2943498966-kativa-hyaluronic-shampoo-hidratacion-profunda-vegano-pelo-_JM', 'http://http2.mlstatic.com/D_706795-MLA84552600602_052025-I.jpg', 'MLC8163', '2025-06-28T00:56:10.968Z'::timestamptz, '2026-01-28T16:44:14.432Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942303216', NULL, 'Infor Pro Sport Creatina X 60 Gomitas Sabor Frutos Tropicales', 13022, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2942303216-infor-pro-sport-creatina-x-60-gomitas-sabor-frutos-tropicales-_JM', 'http://http2.mlstatic.com/D_924382-MLA96085180183_102025-I.jpg', 'MLC435304', '2025-06-27T16:59:17.118Z'::timestamptz, '2026-01-21T16:44:29.818Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942394228', 'BRCH65657', 'Preservativos Condones Lifestyles X15un Skyn Feel Sin Látex', 14102, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942394228-preservativos-condones-lifestyles-x15un-skyn-feel-sin-latex-_JM', 'http://http2.mlstatic.com/D_688747-MLC74247988197_012024-I.jpg', 'MLC174813', '2025-06-27T17:00:57.564Z'::timestamptz, '2026-01-21T16:34:18.996Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943251496', 'RBLN65833', 'Endulzante Tableta Naturalist Stevia Y Sucralosa 900 Un', 3114, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943251496-endulzante-tableta-naturalist-stevia-y-sucralosa-900-un-_JM', 'http://http2.mlstatic.com/D_800820-MLA99385988658_112025-I.jpg', 'MLC413215', '2025-06-27T17:12:58.433Z'::timestamptz, '2026-01-21T16:49:08.128Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942369716', NULL, 'Kativa Hyaluronic Acondicionador Hidratación Profunda Vegano', 6331, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2942369716-kativa-hyaluronic-acondicionador-hidratacion-profunda-vegano-_JM', 'http://http2.mlstatic.com/D_878661-MLA99371831062_112025-I.jpg', 'MLC8163', '2025-06-28T00:59:39.915Z'::timestamptz, '2026-01-21T16:44:16.345Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942277246', 'OLTD66976', 'Preservativos Skyn Extra Lubricated X 6', 5500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942277246-preservativos-skyn-extra-lubricated-x-6-_JM', 'http://http2.mlstatic.com/D_725130-MLC87354753661_072025-I.jpg', 'MLC174813', '2025-06-27T17:04:22.477Z'::timestamptz, '2026-01-21T16:49:08.094Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943261160', 'SSYH65070', 'Puffs Cereal Infantil Kuna Foods Platano Zapallo - 50g', 3890, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943261160-puffs-cereal-infantil-kuna-foods-platano-zapallo-50g-_JM', 'http://http2.mlstatic.com/D_756319-MLC86997573761_062025-I.jpg', 'MLC418152', '2025-06-30T16:55:39.648Z'::timestamptz, '2026-02-04T18:07:15.836Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2950176156', 'QCWO68812', 'Aceite Mustela De Masaje 100 Ml', 9490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2950176156-aceite-mustela-de-masaje-100-ml-_JM', 'http://http2.mlstatic.com/D_988379-MLC89396756481_082025-I.jpg', 'MLC392701', '2025-07-03T15:56:17.273Z'::timestamptz, '2026-02-03T01:58:55.710Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943118506', 'ONOT65117', 'Puffs Cereal Infantil Kuna Foods Manzana Arandano - 50g', 3128, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943118506-puffs-cereal-infantil-kuna-foods-manzana-arandano-50g-_JM', 'http://http2.mlstatic.com/D_832136-MLC89979080615_082025-I.jpg', 'MLC418437', '2025-06-30T17:05:03.301Z'::timestamptz, '2026-02-05T23:58:40.910Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942160228', 'ZRVN66809', 'Stevia Polvo 400 Sobres Naturalist', 5490, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2942160228-stevia-polvo-400-sobres-naturalist-_JM', 'http://http2.mlstatic.com/D_979139-MLC87055271909_072025-I.jpg', 'MLC413215', '2025-06-27T17:10:26.790Z'::timestamptz, '2026-01-21T16:44:23.883Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942174758', 'XJTD63598', 'Organyc Toallitas Compactads De Algodon Baby 60 Un', 6065, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942174758-organyc-toallitas-compactads-de-algodon-baby-60-un-_JM', 'http://http2.mlstatic.com/D_892243-MLA82750018476_032025-I.jpg', 'MLC418676', '2025-06-28T00:53:16.779Z'::timestamptz, '2026-02-02T14:10:46.154Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942213686', 'WQQX64474', 'Pétalos Desmaquillante Biodegradables Organyc 70u Full', 2842, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942213686-petalos-desmaquillante-biodegradables-organyc-70u-full-_JM', 'http://http2.mlstatic.com/D_654897-MLC48837355660_012022-I.jpg', 'MLC392393', '2025-06-28T00:55:06.975Z'::timestamptz, '2026-01-21T16:44:22.128Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942173314', NULL, 'Infor Pro Sport Creatina X 60 Gomitas Sabor Frutos Tropicale Frutas Tropicales', 13022, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2942173314-infor-pro-sport-creatina-x-60-gomitas-sabor-frutos-tropicale-frutas-tropicales-_JM', 'http://http2.mlstatic.com/D_639246-MLA84846512425_052025-I.jpg', 'MLC435304', '2025-06-27T16:59:16.327Z'::timestamptz, '2026-01-21T16:44:29.553Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942213684', 'WQQX64474', 'Pétalos Desmaquillante Biodegradables Organyc 70u Full', 2842, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942213684-petalos-desmaquillante-biodegradables-organyc-70u-full-_JM', 'http://http2.mlstatic.com/D_895008-MLC90191867160_082025-I.jpg', 'MLC392393', '2025-06-28T00:55:06.443Z'::timestamptz, '2026-01-21T16:44:22.931Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2950189532', 'QCWO68812', 'Aceite Mustela De Masaje', 9490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2950189532-aceite-mustela-de-masaje-_JM', 'http://http2.mlstatic.com/D_606126-MLU74197139235_012024-I.jpg', 'MLC392701', '2025-07-03T15:56:17.861Z'::timestamptz, '2026-02-03T01:58:55.711Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942390944', 'AFHP64868', 'Puffs Cereal Infantil Kuna Foods Frutilla Betarraga - 50g', 3300, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942390944-puffs-cereal-infantil-kuna-foods-frutilla-betarraga-50g-_JM', 'http://http2.mlstatic.com/D_742992-MLC86997463015_062025-I.jpg', 'MLC418437', '2025-06-30T17:00:21.975Z'::timestamptz, '2026-02-05T23:45:28.673Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942199330', 'RBLN65833', 'Endulzante Tableta Naturalist Stevia Y Sucralosa 900 Un', 3114, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942199330-endulzante-tableta-naturalist-stevia-y-sucralosa-900-un-_JM', 'http://http2.mlstatic.com/D_627501-MLA84552007424_052025-I.jpg', 'MLC413215', '2025-06-27T17:12:57.922Z'::timestamptz, '2026-01-21T16:44:23.341Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1641818277', 'WCLN98066', 'Beta Alanina Strive 60 Porciones Sin Sabor Sin Sabor', 22300, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1641818277-beta-alanina-strive-60-porciones-sin-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_680331-MLC89910729669_082025-I.jpg', 'MLC435304', '2025-07-10T01:54:48.863Z'::timestamptz, '2026-02-03T13:24:44.887Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942213692', 'LQKN63918', 'Kativa Crema Coconut 300ml - Ml', 6500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942213692-kativa-crema-coconut-300ml-ml-_JM', 'http://http2.mlstatic.com/D_641959-MLA99402184486_112025-I.jpg', 'MLC1266', '2025-06-28T00:58:46.577Z'::timestamptz, '2026-01-21T16:34:10.401Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2947246518', 'AFHP64868', 'Cereales Puffs Kuna Cereal Infantil Betarraga Frutilla En Bolsa Sin Tacc 50 g', 3300, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2947246518-cereales-puffs-kuna-cereal-infantil-betarraga-frutilla-en-bolsa-sin-tacc-50g-_JM', 'http://http2.mlstatic.com/D_922729-MLA99421494152_112025-I.jpg', 'MLC418437', '2025-06-30T18:17:17.390Z'::timestamptz, '2026-02-05T23:45:28.677Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1641521193', 'WBDR89301', 'Isolate Protein Strive 21 Porciones 42 Scoop Sin Sabor', 41990, 88, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1641521193-isolate-protein-strive-21-porciones-42-scoop-sin-sabor-_JM', 'http://http2.mlstatic.com/D_964746-MLC87583411507_072025-I.jpg', 'MLC435304', '2025-07-10T02:23:56.834Z'::timestamptz, '2026-01-30T11:46:35.443Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942213822', 'XLRM63496', 'Acondicionador Kativa Reconstrucción Coconut X355ml', 5859, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942213822-acondicionador-kativa-reconstruccion-coconut-x355ml-_JM', 'http://http2.mlstatic.com/D_961752-MLA99857171637_112025-I.jpg', 'MLC8163', '2025-06-28T02:04:43.784Z'::timestamptz, '2026-01-21T16:34:12.971Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942212312', 'OLTD66976', 'Preservativos Skyn Extra Lubricated X 6', 5500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942212312-preservativos-skyn-extra-lubricated-x-6-_JM', 'http://http2.mlstatic.com/D_810255-MLA99419110602_112025-I.jpg', 'MLC174813', '2025-06-27T17:04:22.986Z'::timestamptz, '2026-01-21T16:44:23.337Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2950215486', 'WNOF68232', 'Te Hibisco Detox Vitalidad 150 Gr Blends & Tea', 14300, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2950215486-te-hibisco-detox-vitalidad-150-gr-blends-tea-_JM', 'http://http2.mlstatic.com/D_637177-MLC89976850513_082025-I.jpg', 'MLC178668', '2025-07-03T16:26:16.122Z'::timestamptz, '2026-01-26T12:45:29.704Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2947112604', 'UENE65332', 'Puffs Cereal Infantil Kuna Foods Pera Espinaca - 50g', 3200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2947112604-puffs-cereal-infantil-kuna-foods-pera-espinaca-50g-_JM', 'http://http2.mlstatic.com/D_614459-MLC89610002178_082025-I.jpg', 'MLC411996', '2025-06-30T17:01:56.558Z'::timestamptz, '2026-02-05T23:45:29.550Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942247960', 'UENE65332', 'Kuna Foods Puffs Cereal Infantil Pera Espinaca Sin Gluten 50g Doypack', 3200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942247960-kuna-foods-puffs-cereal-infantil-pera-espinaca-sin-gluten-50g-doypack-_JM', 'http://http2.mlstatic.com/D_665543-MLA99369295688_112025-I.jpg', 'MLC411996', '2025-06-30T17:01:57.123Z'::timestamptz, '2026-02-05T23:45:29.504Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2999317562', 'XIMQ05025', 'Box 5 Barras Mini Twentys 8g - Your Goal Sabor Chocolate Bro Chocolate Brownie', 6000, 52, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2999317562-box-5-barras-mini-twentys-8g-your-goal-sabor-chocolate-bro-chocolate-brownie-_JM', 'http://http2.mlstatic.com/D_842609-MLU73844676617_012024-I.jpg', 'MLC3551', '2025-07-30T18:37:53.490Z'::timestamptz, '2026-02-05T21:32:13.248Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2997855954', 'OKIS87083', 'Candelabro O Portavela De Vidrio 11cm 2,5cm Diámetro Transparente', 4990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2997855954-candelabro-o-portavela-de-vidrio-11cm-25cm-diametro-transparente-_JM', 'http://http2.mlstatic.com/D_818812-MLC88550370288_072025-I.jpg', 'MLC413412', '2025-07-29T18:42:52.042Z'::timestamptz, '2026-01-21T16:44:25.294Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2997971940', 'BOLC76754', 'Candelabro O Porta Velas De Vidrio 14cm 2,5cm Diametro Transparente', 4990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2997971940-candelabro-o-porta-velas-de-vidrio-14cm-25cm-diametro-transparente-_JM', 'http://http2.mlstatic.com/D_759905-MLC88563854040_072025-I.jpg', 'MLC413412', '2025-07-30T00:39:38.215Z'::timestamptz, '2026-01-31T20:59:02.397Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1646935669', 'TXKF55328', 'Pack 10 Sobres Twopack (villano + Heroe) Superzings Serie 3', 18301, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1646935669-pack-10-sobres-twopack-villano-heroe-superzings-serie-3-_JM', 'http://http2.mlstatic.com/D_602613-MLA99943277877_112025-I.jpg', 'MLC3422', '2025-07-16T02:45:43.446Z'::timestamptz, '2026-01-21T16:44:22.605Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2999369414', 'QCGO92597', 'Box 5 Barras Mini Twentys 8g - Your Goal Sabor Lemon Cheesec', 5599, 28, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2999369414-box-5-barras-mini-twentys-8g-your-goal-sabor-lemon-cheesec-_JM', 'http://http2.mlstatic.com/D_943610-MLU73806594406_012024-I.jpg', 'MLC376470', '2025-07-30T18:39:13.193Z'::timestamptz, '2026-02-05T21:32:05.388Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2980636552', 'GGDR77202', 'Ganesha Estatua Pileta Fuente De Agua Interior Con Luz 18cm Color Dorado', 14993, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2980636552-ganesha-estatua-pileta-fuente-de-agua-interior-con-luz-18cm-color-dorado-_JM', 'http://http2.mlstatic.com/D_880363-MLA96655650417_102025-I.jpg', 'MLC412687', '2025-07-18T15:30:39.117Z'::timestamptz, '2026-02-02T01:17:56.838Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2978896122', 'DDKG01408', 'Panera Redonda De Mimbre 24 Cm Amarillo', 4990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2978896122-panera-redonda-de-mimbre-24-cm-amarillo-_JM', 'http://http2.mlstatic.com/D_921869-MLC87874881856_072025-I.jpg', 'MLC413476', '2025-07-19T02:09:55.517Z'::timestamptz, '2026-01-21T16:49:08.448Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2978908502', 'UGQX01215', 'Fuente Pileta Cascada De Agua Buda 41 Cm Feng Shui Gris', 36530, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2978908502-fuente-pileta-cascada-de-agua-buda-41-cm-feng-shui-gris-_JM', 'http://http2.mlstatic.com/D_610999-MLC87872253486_072025-I.jpg', 'MLC32663', '2025-07-19T00:22:59.914Z'::timestamptz, '2026-01-21T16:34:18.935Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2986750152', NULL, 'Frosch Antigrasa Gatillo Pomelo 500 Cc', 3925, 5, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2986750152-frosch-antigrasa-gatillo-pomelo-500-cc-_JM', 'http://http2.mlstatic.com/D_972831-MLU74859071344_032024-I.jpg', 'MLC440243', '2025-07-23T02:09:50.411Z'::timestamptz, '2026-01-21T16:44:21.591Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1656116407', 'VFVU01579', 'Candelabro O Porta Vela De Vidrio 15cm 2,5cm Diametro Transparente', 6490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1656116407-candelabro-o-porta-vela-de-vidrio-15cm-25cm-diametro-transparente-_JM', 'http://http2.mlstatic.com/D_860212-MLC88553790376_072025-I.jpg', 'MLC413412', '2025-07-29T19:33:54.005Z'::timestamptz, '2026-01-21T16:44:24.240Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2978896086', 'MPGV90854', 'Panera Ovalada De Mimbre 27cm Dorado', 4990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2978896086-panera-ovalada-de-mimbre-27cm-dorado-_JM', 'http://http2.mlstatic.com/D_639880-MLC87874867630_072025-I.jpg', 'MLC413476', '2025-07-19T02:03:42.908Z'::timestamptz, '2026-01-21T16:34:09.217Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2976017074', 'MVFX76540', 'Dermo Vagisil Jabón Liquido Intimo Ph Balanceado 354 Ml', 8623, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2976017074-dermo-vagisil-jabon-liquido-intimo-ph-balanceado-354-ml-_JM', 'http://http2.mlstatic.com/D_910298-MLA99905173171_112025-I.jpg', 'MLC453571', '2025-07-17T19:12:25.835Z'::timestamptz, '2026-01-31T08:09:27.301Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2984744820', 'SZAU97949', 'Fuente De Agua Pileta De Agua Virgen Maria Con Luz 18 Cm Color Gris', 24988, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2984744820-fuente-de-agua-pileta-de-agua-virgen-maria-con-luz-18-cm-color-gris-_JM', 'http://http2.mlstatic.com/D_767516-MLA95219846518_102025-I.jpg', 'MLC412687', '2025-07-21T19:31:52.954Z'::timestamptz, '2026-01-21T16:44:23.768Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2999407926', 'HXNO92550', 'Barras Proteína Your Goal Chocolate Fudge Sin Gluten Keto Low Carb', 5990, 41, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2999407926-barras-proteina-your-goal-chocolate-fudge-sin-gluten-keto-low-carb-_JM', 'http://http2.mlstatic.com/D_776038-MLA99579430978_122025-I.jpg', 'MLC3551', '2025-07-30T18:36:05.655Z'::timestamptz, '2026-02-05T21:32:05.720Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1656286403', 'VEGG01291', 'Pack 3 Candelabro O Portavela De Vidrio Flor De Loto 12cm Transparente', 8100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1656286403-pack-3-candelabro-o-portavela-de-vidrio-flor-de-loto-12cm-transparente-_JM', 'http://http2.mlstatic.com/D_687405-MLC88567675696_072025-I.jpg', 'MLC440188', '2025-07-30T01:55:50.738Z'::timestamptz, '2026-01-21T16:44:28.108Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2997910656', 'XRGA89941', 'Pack 3 Candelabro O Portavela De Vidrio Flor De Loto 12cm Transparente 2', 8100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2997910656-pack-3-candelabro-o-portavela-de-vidrio-flor-de-loto-12cm-transparente-2-_JM', 'http://http2.mlstatic.com/D_950215-MLC88567420086_072025-I.jpg', 'MLC440188', '2025-07-30T01:55:50.715Z'::timestamptz, '2026-01-21T16:44:28.814Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2976030226', 'MVFX76540', 'Dermo Vagisil Jabón Liquido Intimo Ph Balanceado 354 Ml', 8623, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2976030226-dermo-vagisil-jabon-liquido-intimo-ph-balanceado-354-ml-_JM', 'http://http2.mlstatic.com/D_746991-MLC88119217407_072025-I.jpg', 'MLC453571', '2025-07-17T19:12:25.280Z'::timestamptz, '2026-02-05T22:36:40.305Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2986698430', NULL, 'Limpiador Antigrasa Frosch Pomelo 500ml Gatillo Para Cocina Hornos Parrillas', 3925, 5, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-2986698430-limpiador-antigrasa-frosch-pomelo-500ml-gatillo-para-cocina-hornos-parrillas-_JM', 'http://http2.mlstatic.com/D_951691-MLA99345257994_112025-I.jpg', 'MLC440243', '2025-07-23T02:09:51.010Z'::timestamptz, '2026-01-21T16:34:11.137Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1656345313', 'FEDW88850', 'Pack 3 Candelabro O Portavela Flor De Loto Grande 15 Cm Transparente', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1656345313-pack-3-candelabro-o-portavela-flor-de-loto-grande-15-cm-transparente-_JM', 'http://http2.mlstatic.com/D_620902-MLC88573322106_072025-I.jpg', 'MLC440188', '2025-07-30T03:58:28.331Z'::timestamptz, '2026-01-21T16:44:23.339Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1656282035', 'XPUE88312', 'Candelabro O Porta Vela De Vidrio 16cm 2,5cm Diametro Transparente', 6490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1656282035-candelabro-o-porta-vela-de-vidrio-16cm-25cm-diametro-transparente-_JM', 'http://http2.mlstatic.com/D_910853-MLC88913455017_072025-I.jpg', 'MLC413412', '2025-07-30T00:19:35.410Z'::timestamptz, '2026-01-21T16:34:08.911Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3005659656', 'PMGR90672', 'Fungi Pharma Extracto De Hongo Chaga Inmunomodulador 30ml Sin Sabor', 12500, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3005659656-fungi-pharma-extracto-de-hongo-chaga-inmunomodulador-30ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_750851-MLC89003603592_082025-I.jpg', 'MLC435304', '2025-08-04T19:31:26.452Z'::timestamptz, '2026-01-31T19:21:23.473Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3005621100', 'LQKN89630', 'Suplemento En Gotas Cola De Pavo Fungi Pharma 30ml Doble Extracción Sin Sabor', 11539, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3005621100-suplemento-en-gotas-cola-de-pavo-fungi-pharma-30ml-doble-extraccion-sin-sabor-_JM', 'http://http2.mlstatic.com/D_691683-MLA99906675849_112025-I.jpg', 'MLC435304', '2025-08-04T19:36:37.478Z'::timestamptz, '2026-01-30T12:52:54.251Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3025065170', 'CBNX92363', 'Soporte Para Auto Hoco Ca94 Polaris Para Rejilla Negro', 4690, 63, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3025065170-soporte-para-auto-hoco-ca94-polaris-para-rejilla-negro-_JM', 'http://http2.mlstatic.com/D_974848-MLA99904138137_112025-I.jpg', 'MLC440666', '2025-08-09T04:24:54.717Z'::timestamptz, '2026-02-06T01:01:13.535Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3005569042', 'LQKN89630', 'Fungi Pharma Extracto De Hongo Cola De Pavo Adaptogeno 30ml Sin Sabor', 11539, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3005569042-fungi-pharma-extracto-de-hongo-cola-de-pavo-adaptogeno-30ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_984173-MLC89003737092_082025-I.jpg', 'MLC435304', '2025-08-04T19:36:36.874Z'::timestamptz, '2026-01-30T12:52:47.476Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2999253390', 'HXNO92550', 'Box 5 Barras Mini Twentys 8g - Your Goal Sabor Chocolate Fud - Chocolate Fudge', 5990, 41, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2999253390-box-5-barras-mini-twentys-8g-your-goal-sabor-chocolate-fud-chocolate-fudge-_JM', 'http://http2.mlstatic.com/D_691146-MLU73747352264_012024-I.jpg', 'MLC3551', '2025-07-30T18:36:05.018Z'::timestamptz, '2026-02-05T21:32:05.717Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1657828571', 'CBQU91832', 'Soporte Celular Rejilla Auto Resistente Hoco Ajustable 360 Negro', 4607, 30, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1657828571-soporte-celular-rejilla-auto-resistente-hoco-ajustable-360-negro-_JM', 'http://http2.mlstatic.com/D_896797-MLC89065560381_072025-I.jpg', 'MLC440666', '2025-07-31T17:49:36.857Z'::timestamptz, '2026-02-04T13:56:51.175Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3009771438', 'QBKE89081', 'Goldenmilk Cacao 240 Gr - Leche Dorada Alma Foods', 20990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3009771438-goldenmilk-cacao-240-gr-leche-dorada-alma-foods-_JM', 'http://http2.mlstatic.com/D_893881-MLC89143289144_082025-I.jpg', 'MLC178668', '2025-08-06T05:16:28.149Z'::timestamptz, '2026-02-05T02:17:46.492Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1657770681', 'BWRF90485', 'Goma Eva Plegable  1,8m X 1,5m 6mm Resistente Niños Bebes Multicolor Azul Verde', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1657770681-goma-eva-plegable-18m-x-15m-6mm-resistente-ninos-bebes-multicolor-azul-verde-_JM', 'http://http2.mlstatic.com/D_671121-MLC89076165407_072025-I.jpg', 'MLC439869', '2025-07-31T22:02:06.143Z'::timestamptz, '2026-01-21T16:44:26.265Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1657980961', 'UITQ89551', 'Goma Eva Plegable  1,8m X 1,5m 6mm Resistente Niños Bebes Multicolor Alce Jirafa', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1657980961-goma-eva-plegable-18m-x-15m-6mm-resistente-ninos-bebes-multicolor-alce-jirafa-_JM', 'http://http2.mlstatic.com/D_642073-MLC89076209417_072025-I.jpg', 'MLC439869', '2025-07-31T22:02:06.132Z'::timestamptz, '2026-01-21T16:44:19.088Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3004433330', 'SZGU09152', 'Separador De Servicios Organizador De Servicios O Cubiertos Color Transparente', 8557, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3004433330-separador-de-servicios-organizador-de-servicios-o-cubiertos-color-transparente-_JM', 'http://http2.mlstatic.com/D_869093-MLA99523402628_122025-I.jpg', 'MLC436420', '2025-08-03T16:28:57.079Z'::timestamptz, '2026-01-21T16:34:13.972Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3005503866', 'LJTH91660', 'Fungi Pharma Extracto De Hongo Cordyceps Adaptogeno 30ml Sin Sabor', 14515, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3005503866-fungi-pharma-extracto-de-hongo-cordyceps-adaptogeno-30ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_761752-MLC89362812511_082025-I.jpg', 'MLC435304', '2025-08-04T19:33:20.706Z'::timestamptz, '2026-01-21T16:49:08.415Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3005503868', 'LJTH91660', 'Fungi Pharma Cordyceps Suplemento Gotas Herbal Sin Lactosa Ni Gluten Sin Sabor', 14515, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3005503868-fungi-pharma-cordyceps-suplemento-gotas-herbal-sin-lactosa-ni-gluten-sin-sabor-_JM', 'http://http2.mlstatic.com/D_868042-MLA99503062828_112025-I.jpg', 'MLC435304', '2025-08-04T19:33:21.302Z'::timestamptz, '2026-01-21T16:44:30.795Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3005556052', 'NISH88850', 'Fungi Pharma - Extracto De Hongo Maitake 30ml Sin Sabor', 11821, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3005556052-fungi-pharma-extracto-de-hongo-maitake-30ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_898057-MLC89003989098_082025-I.jpg', 'MLC435304', '2025-08-04T19:38:06.949Z'::timestamptz, '2026-01-23T15:33:31.241Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3005595056', 'HMPD91163', 'Fungi Pharma - Extracto De Hongo Shiitake 30 Ml Sin Sabor', 11539, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3005595056-fungi-pharma-extracto-de-hongo-shiitake-30-ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_726517-MLC89363638911_082025-I.jpg', 'MLC435304', '2025-08-04T19:35:14.858Z'::timestamptz, '2026-01-21T16:44:31.400Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3008124202', 'NISH88850', 'Fungi Pharma Maitake Adaptogeno Sin Sabor', 11821, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3008124202-fungi-pharma-maitake-adaptogeno-sin-sabor-_JM', 'http://http2.mlstatic.com/D_730515-MLA104664721469_012026-I.jpg', 'MLC435304', '2025-08-05T20:31:49.767Z'::timestamptz, '2026-01-21T16:44:23.698Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3009302444', 'TNSC35241', 'Goldenmilk Matcha 240 Gr - Leche Dorada Alma Foods', 20990, 17, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3009302444-goldenmilk-matcha-240-gr-leche-dorada-alma-foods-_JM', 'http://http2.mlstatic.com/D_954669-MLC89143264736_082025-I.jpg', 'MLC178668', '2025-08-06T05:09:26.425Z'::timestamptz, '2026-02-02T18:19:40.100Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1657835319', 'IRRJ01099', 'Goma Eva Plegable  1,8m X 1,5m 6mm Resistente Niños Bebes Multicolor Rosado', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1657835319-goma-eva-plegable-18m-x-15m-6mm-resistente-ninos-bebes-multicolor-rosado-_JM', 'http://http2.mlstatic.com/D_971335-MLC88724953074_072025-I.jpg', 'MLC439869', '2025-07-31T22:02:06.135Z'::timestamptz, '2026-01-22T17:43:46.843Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2999305100', 'XIMQ05025', 'Barras Proteicas Your Goal Sabor Chocolate Brownie Sin Gluten Keto Brownie De Chocolate', 6000, 52, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2999305100-barras-proteicas-your-goal-sabor-chocolate-brownie-sin-gluten-keto-brownie-de-chocolate-_JM', 'http://http2.mlstatic.com/D_805009-MLA99601543080_122025-I.jpg', 'MLC3551', '2025-07-30T18:37:54.115Z'::timestamptz, '2026-02-05T21:32:13.242Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2999253474', 'QCGO92597', 'Barra Proteica Your Goal 5 Barras Mini Twentys Lemon Cheesecake Sin Gluten 8g Proteína', 5599, 28, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2999253474-barra-proteica-your-goal-5-barras-mini-twentys-lemon-cheesecake-sin-gluten-8g-proteina-_JM', 'http://http2.mlstatic.com/D_891359-MLA99589712260_122025-I.jpg', 'MLC376470', '2025-07-30T18:39:13.770Z'::timestamptz, '2026-02-05T21:32:05.379Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1657892519', 'CBQU91832', 'Soporte Celular Rejilla Auto Resistente Hoco Ajustable 360 Negro', 4607, 30, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1657892519-soporte-celular-rejilla-auto-resistente-hoco-ajustable-360-negro-_JM', 'http://http2.mlstatic.com/D_820604-MLA100351796774_122025-I.jpg', 'MLC440666', '2025-07-31T17:49:37.464Z'::timestamptz, '2026-02-04T13:56:49.626Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669115003', 'YXIG93419', 'Plancha De Vapor Th-7003 Color Blanco Blanco', 14603, 15, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669115003-plancha-de-vapor-th-7003-color-blanco-blanco-_JM', 'http://http2.mlstatic.com/D_782063-MLC89454434418_082025-I.jpg', 'MLC162501', '2025-08-10T18:52:52.651Z'::timestamptz, '2026-02-05T12:47:59.951Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669130145', 'YMHO94006', 'Extractor De Jugo Th-2652i Color Gris', 67890, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669130145-extractor-de-jugo-th-2652i-color-gris-_JM', 'http://http2.mlstatic.com/D_709925-MLA99461746480_112025-I.jpg', 'MLC440070', '2025-08-10T19:45:16.233Z'::timestamptz, '2026-02-05T05:59:31.427Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3038184008', 'WCLN98066', 'Beta Alanina Strive 60 Porciones Sin Sabor Sin Sabor', 22300, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3038184008-beta-alanina-strive-60-porciones-sin-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_739658-MLA92027489050_092025-I.jpg', 'MLC435304', '2025-08-11T19:45:33.826Z'::timestamptz, '2026-02-03T13:24:44.885Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1671204425', 'EVGP93419', 'Quitapelusa Siegen Sg-1010', 8280, 33, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1671204425-quitapelusa-siegen-sg-1010-_JM', 'http://http2.mlstatic.com/D_805839-MLA99610991440_122025-I.jpg', 'MLC432230', '2025-08-12T14:47:44.276Z'::timestamptz, '2026-02-04T12:42:45.480Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067436312', 'RCIC10365', 'Kativa Keratina Acondicionador Nutricion Y Brillo Pelo 355ml', 7190, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067436312-kativa-keratina-acondicionador-nutricion-y-brillo-pelo-355ml-_JM', 'http://http2.mlstatic.com/D_913601-MLA99900276033_112025-I.jpg', 'MLC8163', '2025-08-20T03:34:03.550Z'::timestamptz, '2026-01-21T16:34:10.118Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669267867', 'VZQG93636', 'Alisador Siegen Sg-3510 Cerámica + Tourmalina Fucsia', 21772, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669267867-alisador-siegen-sg-3510-ceramica-tourmalina-fucsia-_JM', 'http://http2.mlstatic.com/D_963569-MLC89824098795_082025-I.jpg', 'MLC178457', '2025-08-10T19:47:49.476Z'::timestamptz, '2026-01-21T16:44:21.364Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3040326008', 'VFVU01579', 'Candelabro Moderno Vidrio Transparente 15cm 1 Brazo Bazaro Cuadrado Doble', 6490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3040326008-candelabro-moderno-vidrio-transparente-15cm-1-brazo-bazaro-cuadrado-doble-_JM', 'http://http2.mlstatic.com/D_688441-MLA95663078963_102025-I.jpg', 'MLC413412', '2025-08-13T04:33:58.001Z'::timestamptz, '2026-01-21T16:44:24.501Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669255479', 'SBVQ94790', 'Ondulador Siegen Sg-2411 Cilindro 25mm Color Negro Negro', 15500, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669255479-ondulador-siegen-sg-2411-cilindro-25mm-color-negro-negro-_JM', 'http://http2.mlstatic.com/D_858523-MLC89456037396_082025-I.jpg', 'MLC43660', '2025-08-10T19:43:16.240Z'::timestamptz, '2026-02-04T15:20:33.318Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3042430604', 'WBDR89301', 'Suplemento En Polvo Strive Proteína Aislada X 700g', 41990, 88, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3042430604-suplemento-en-polvo-strive-proteina-aislada-x-700g-_JM', 'http://http2.mlstatic.com/D_975124-MLA99478462294_112025-I.jpg', 'MLC435304', '2025-08-14T03:45:44.007Z'::timestamptz, '2026-01-30T11:46:35.438Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3040016192', 'OKIS87083', 'Candelabro Bazaro Cristal Vidrio Transparente 11cm Clásico', 4990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3040016192-candelabro-bazaro-cristal-vidrio-transparente-11cm-clasico-_JM', 'http://http2.mlstatic.com/D_629155-MLA96250175350_102025-I.jpg', 'MLC413412', '2025-08-13T04:26:42.562Z'::timestamptz, '2026-01-26T07:32:46.696Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3024819090', 'CBNX92363', 'Soporte Para Auto Hoco Ca94 Polaris Para Rejilla Negro Negro', 4690, 63, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3024819090-soporte-para-auto-hoco-ca94-polaris-para-rejilla-negro-negro-_JM', 'http://http2.mlstatic.com/D_927303-MLC89752109227_082025-I.jpg', 'MLC440666', '2025-08-09T04:24:54.174Z'::timestamptz, '2026-02-06T01:01:13.551Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669280533', 'VZQG93636', 'Alisador Siegen Sg-3510 Cerámica + Tourmalina', 21772, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669280533-alisador-siegen-sg-3510-ceramica-tourmalina-_JM', 'http://http2.mlstatic.com/D_791303-MLU72700320473_112023-I.jpg', 'MLC178457', '2025-08-10T19:47:50.057Z'::timestamptz, '2026-01-21T16:34:09.814Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3040313278', 'XPUE88312', 'Candelabro O Porta Vela De Vidrio 16cm 2,5cm Diametro Transparente', 6490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3040313278-candelabro-o-porta-vela-de-vidrio-16cm-25cm-diametro-transparente-_JM', 'http://http2.mlstatic.com/D_623500-MLA95578876825_102025-I.jpg', 'MLC413412', '2025-08-13T04:29:52.493Z'::timestamptz, '2026-01-21T16:44:30.155Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1668974445', 'YMHO94006', 'Extractor De Jugo Th-2652i Color Gris Gris', 67890, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1668974445-extractor-de-jugo-th-2652i-color-gris-gris-_JM', 'http://http2.mlstatic.com/D_966892-MLC89824098175_082025-I.jpg', 'MLC440070', '2025-08-10T19:45:15.682Z'::timestamptz, '2026-02-05T05:59:31.433Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906181212', 'XYZQ48240', 'Power Bank 20000 Bateria Portatil Super Carga 22.5w Hoco Col Negro', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906181212-power-bank-20000-bateria-portatil-super-carga-225w-hoco-col-negro-_JM', 'http://http2.mlstatic.com/D_951251-MLU73881806145_012024-I.jpg', 'MLC157684', '2025-05-30T12:12:18.007Z'::timestamptz, '2026-01-21T16:44:26.275Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3040325866', 'UGQX01215', 'Fuente Pileta Cascada De Agua Buda 41 Cm Feng Shui Gris', 36530, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3040325866-fuente-pileta-cascada-de-agua-buda-41-cm-feng-shui-gris-_JM', 'http://http2.mlstatic.com/D_716243-MLA89610708992_082025-I.jpg', 'MLC32663', '2025-08-13T04:01:39.945Z'::timestamptz, '2026-01-21T16:34:10.351Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1668961729', 'SBVQ94790', 'Ondulador Siegen Sg-2411 Cilindro 25mm Color Negro', 15500, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1668961729-ondulador-siegen-sg-2411-cilindro-25mm-color-negro-_JM', 'http://http2.mlstatic.com/D_626505-MLA84845434813_052025-I.jpg', 'MLC43660', '2025-08-10T19:43:16.825Z'::timestamptz, '2026-02-04T15:20:33.313Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669253391', 'YXIG93419', 'Plancha De Vapor Th-7003 Color Blanco', 14603, 15, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669253391-plancha-de-vapor-th-7003-color-blanco-_JM', 'http://http2.mlstatic.com/D_897458-MLA99593230380_122025-I.jpg', 'MLC162501', '2025-08-10T18:52:53.184Z'::timestamptz, '2026-02-05T12:47:59.974Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906254752', 'XYZQ48240', 'Power Bank 20000 Bateria Portatil Super Carga 22.5w Hoco Color Negro', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906254752-power-bank-20000-bateria-portatil-super-carga-225w-hoco-color-negro-_JM', 'http://http2.mlstatic.com/D_915653-MLA100010086156_122025-I.jpg', 'MLC157684', '2025-05-30T12:12:18.545Z'::timestamptz, '2026-01-21T16:44:23.350Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1671256301', 'EVGP93419', 'Quitapelusa Siegen Sg-1010', 8280, 33, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1671256301-quitapelusa-siegen-sg-1010-_JM', 'http://http2.mlstatic.com/D_913745-MLC89576580402_082025-I.jpg', 'MLC432230', '2025-08-12T14:47:43.676Z'::timestamptz, '2026-02-04T12:42:45.477Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067320460', 'UWNV98225', 'Curl Activator Cream X240ml - Ml', 8700, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067320460-curl-activator-cream-x240ml-ml-_JM', 'http://http2.mlstatic.com/D_793569-MLC90098129464_082025-I.jpg', 'MLC388017', '2025-08-20T03:31:33.906Z'::timestamptz, '2026-01-21T16:44:26.506Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3086129970', 'FWEM13644', 'Batidora Pedestal Planetaria Th-911b Color Blanco Blanco', 72990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3086129970-batidora-pedestal-planetaria-th-911b-color-blanco-blanco-_JM', 'http://http2.mlstatic.com/D_911170-MLC90376292914_082025-I.jpg', 'MLC440064', '2025-08-22T18:43:32.737Z'::timestamptz, '2026-01-21T16:34:08.572Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3086129984', 'SGKM13103', 'Batidora Eléctrica Thomas Th-910pr Color Rojo - Rojo', 94559, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3086129984-batidora-electrica-thomas-th-910pr-color-rojo-rojo-_JM', 'http://http2.mlstatic.com/D_619951-MLC90376253372_082025-I.jpg', 'MLC440064', '2025-08-22T18:44:28.676Z'::timestamptz, '2026-01-25T17:29:32.089Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067320464', 'UWNV98225', 'Curl Activator Cream X240ml - Ml', 8700, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067320464-curl-activator-cream-x240ml-ml-_JM', 'http://http2.mlstatic.com/D_688800-MLA81893104180_012025-I.jpg', 'MLC388017', '2025-08-20T03:31:34.438Z'::timestamptz, '2026-01-21T16:44:30.145Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067333060', 'UUIQ98084', 'Shampoo Kativa Curly Plex 355 Ml', 6581, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067333060-shampoo-kativa-curly-plex-355-ml-_JM', 'http://http2.mlstatic.com/D_818120-MLC90097221170_082025-I.jpg', 'MLC8163', '2025-08-20T03:30:18.116Z'::timestamptz, '2026-01-21T16:44:26.259Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067307584', NULL, 'Kativa Shampoo Keratina · Nutrición, Suavidad Y Brillo 355ml', 5537, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3067307584-kativa-shampoo-keratina-nutricion-suavidad-y-brillo-355ml-_JM', 'http://http2.mlstatic.com/D_669563-MLC90481198135_082025-I.jpg', 'MLC8163', '2025-08-20T03:38:48.477Z'::timestamptz, '2026-01-21T16:34:12.736Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067333198', 'RCIC10365', 'Kativa Keratina Acondicionador Nutricion Y Brillo Pelo 355ml', 7190, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067333198-kativa-keratina-acondicionador-nutricion-y-brillo-pelo-355ml-_JM', 'http://http2.mlstatic.com/D_865909-MLC90097113774_082025-I.jpg', 'MLC8163', '2025-08-20T03:34:02.973Z'::timestamptz, '2026-01-21T16:44:23.309Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678124523', 'ZDPH13001', 'Secador De Pelo Siegen Sg-3005 Pocket Color Negro', 10311, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678124523-secador-de-pelo-siegen-sg-3005-pocket-color-negro-_JM', 'http://http2.mlstatic.com/D_725517-MLA99926176595_112025-I.jpg', 'MLC4597', '2025-08-22T18:46:45.705Z'::timestamptz, '2026-01-22T13:20:29.014Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067424090', 'SMNX09613', 'Acndicionador Profundo Kativa Curly Plex 450 Ml', 8256, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067424090-acndicionador-profundo-kativa-curly-plex-450-ml-_JM', 'http://http2.mlstatic.com/D_972893-MLC90479929023_082025-I.jpg', 'MLC8163', '2025-08-20T03:32:37.167Z'::timestamptz, '2026-01-21T16:44:18.253Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067397828', 'SMNX09613', 'Acndicionador Profundo Kativa Curly Plex 450 Ml', 8256, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067397828-acndicionador-profundo-kativa-curly-plex-450-ml-_JM', 'http://http2.mlstatic.com/D_785023-MLA99345092378_112025-I.jpg', 'MLC8163', '2025-08-20T03:32:37.701Z'::timestamptz, '2026-01-21T16:49:08.650Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067408210', 'GLTC98239', 'Audifonos Para iPhone Lightning Con Microfono Hoco Blanco Blanco', 10080, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067408210-audifonos-para-iphone-lightning-con-microfono-hoco-blanco-blanco-_JM', 'http://http2.mlstatic.com/D_769660-MLC90087063778_082025-I.jpg', 'MLC441017', '2025-08-20T02:17:52.407Z'::timestamptz, '2026-02-04T15:39:18.736Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678099155', 'OKIS99869', 'Alisador Siegen Sg-b4758 Vapor Ultrasónico + Luz Infrarroja Color Blanco', 79197, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678099155-alisador-siegen-sg-b4758-vapor-ultrasonico-luz-infrarroja-color-blanco-_JM', 'http://http2.mlstatic.com/D_806380-MLA99382959222_112025-I.jpg', 'MLC178457', '2025-08-22T18:45:36.785Z'::timestamptz, '2026-01-21T16:44:27.103Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678111779', 'PUVI99334', 'Ondulador Siegen Sg-2420 Cilindro 33mm Color Negro Negro', 14019, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678111779-ondulador-siegen-sg-2420-cilindro-33mm-color-negro-negro-_JM', 'http://http2.mlstatic.com/D_647918-MLC90762880271_082025-I.jpg', 'MLC440077', '2025-08-22T18:41:56.534Z'::timestamptz, '2026-01-21T16:44:28.368Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1675875181', 'UUIQ98084', 'Shampoo Kativa Curly Plex 355 Ml', 6581, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1675875181-shampoo-kativa-curly-plex-355-ml-_JM', 'http://http2.mlstatic.com/D_822337-MLA99368655042_112025-I.jpg', 'MLC8163', '2025-08-20T03:30:18.677Z'::timestamptz, '2026-01-21T16:44:26.716Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067384908', 'SCOC96569', 'Tratamiento Capilar Kativa Intenso Con Keratina 300ml', 8192, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067384908-tratamiento-capilar-kativa-intenso-con-keratina-300ml-_JM', 'http://http2.mlstatic.com/D_802186-MLC90481376831_082025-I.jpg', 'MLC388017', '2025-08-20T03:37:48.344Z'::timestamptz, '2026-01-21T16:44:23.575Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1675888299', NULL, 'Kativa Shampoo Keratina · Nutrición, Suavidad Y Brillo 355ml', 5537, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1675888299-kativa-shampoo-keratina-nutricion-suavidad-y-brillo-355ml-_JM', 'http://http2.mlstatic.com/D_906331-MLA99424006628_112025-I.jpg', 'MLC8163', '2025-08-20T03:38:49.052Z'::timestamptz, '2026-01-21T16:34:14.086Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067320724', 'SCOC96569', 'Tratamiento Capilar Kativa Intenso Con Keratina 300ml', 8192, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067320724-tratamiento-capilar-kativa-intenso-con-keratina-300ml-_JM', 'http://http2.mlstatic.com/D_784848-MLA99890414107_112025-I.jpg', 'MLC388017', '2025-08-20T03:37:48.911Z'::timestamptz, '2026-01-23T12:29:26.152Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678226311', 'OKIS99869', 'Alisador Siegen Sg-b4758 Vapor Ultrasónico + Luz Infrarroja Blanco', 79197, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678226311-alisador-siegen-sg-b4758-vapor-ultrasonico-luz-infrarroja-blanco-_JM', 'http://http2.mlstatic.com/D_831287-MLC90763457033_082025-I.jpg', 'MLC178457', '2025-08-22T18:45:36.208Z'::timestamptz, '2026-01-21T16:34:20.569Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678124499', 'SGKM13103', 'Batidora Eléctrica Thomas Th-910pr Color Rojo', 94559, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678124499-batidora-electrica-thomas-th-910pr-color-rojo-_JM', 'http://http2.mlstatic.com/D_989263-MLA99974409615_112025-I.jpg', 'MLC440064', '2025-08-22T18:44:29.201Z'::timestamptz, '2026-01-25T17:29:32.081Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3067305126', 'GLTC98239', 'Auriculares Hoco M111 Para iPhone Lightning Alta Calidad Color Blanco', 10080, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3067305126-auriculares-hoco-m111-para-iphone-lightning-alta-calidad-color-blanco-_JM', 'http://http2.mlstatic.com/D_609170-MLA100077470547_122025-I.jpg', 'MLC441017', '2025-08-20T02:17:52.916Z'::timestamptz, '2026-02-04T15:39:18.748Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1686875221', 'JNTV41221', 'Barras De Proteina Twenty''s Sabor Avellana Hazelnut Praline Pack 4 Barritas 60g C/u Yourgoal Nutrition Suplemento Con Proteina', 8450, 69, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1686875221-barras-de-proteina-twentys-sabor-avellana-hazelnut-praline-pack-4-barritas-60g-cu-yourgoal-nutrition-suplemento-con-proteina-_JM', 'http://http2.mlstatic.com/D_937282-MLA99840896781_112025-I.jpg', 'MLC376470', '2025-09-01T20:26:42.820Z'::timestamptz, '2026-02-05T21:32:11.304Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114603244', 'WGUA08059', 'Rooibos Relax 150g Blends And Tea', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114603244-rooibos-relax-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_927915-MLC91144702182_092025-I.jpg', 'MLC178668', '2025-09-03T00:01:18.518Z'::timestamptz, '2026-01-21T16:44:22.653Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3108057824', 'YVZG45551', 'Citrato De Magnesio + Citrato De Potasio 1 Kilo En Polvo Sabor Propio', 26490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3108057824-citrato-de-magnesio-citrato-de-potasio-1-kilo-en-polvo-sabor-propio-_JM', 'http://http2.mlstatic.com/D_804749-MLA99459109788_112025-I.jpg', 'MLC435304', '2025-08-29T23:36:54.084Z'::timestamptz, '2026-02-04T19:21:59.922Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678034875', 'FNPO99381', 'Trimmer Siegen Sg-8011 2en 1 Color Negro', 9262, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678034875-trimmer-siegen-sg-8011-2en-1-color-negro-_JM', 'http://http2.mlstatic.com/D_719209-MLA99993747267_112025-I.jpg', 'MLC5411', '2025-08-22T18:40:36.473Z'::timestamptz, '2026-01-21T16:44:33.278Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1686965677', 'EICE39558', 'Barra De Proteína Chocolate Fudge Your Goal Sin Gluten Box 4 Barras', 8980, 55, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1686965677-barra-de-proteina-chocolate-fudge-your-goal-sin-gluten-box-4-barras-_JM', 'http://http2.mlstatic.com/D_845582-MLA99958452361_112025-I.jpg', 'MLC435304', '2025-09-01T20:25:18.398Z'::timestamptz, '2026-02-05T22:40:00.021Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3108989094', 'HMPD91163', 'Fungi Pharma - Extracto De Hongo Shiitake 30 Ml Sin Sabor', 11539, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3108989094-fungi-pharma-extracto-de-hongo-shiitake-30-ml-sin-sabor-_JM', 'http://http2.mlstatic.com/D_865891-MLA92741027701_092025-I.jpg', 'MLC435304', '2025-08-30T18:00:46.158Z'::timestamptz, '2026-01-21T16:49:08.317Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3110787142', 'OXPB85517', 'Espejo Para Maquillaje Espejo Doble De Mesa Con Aumento 36cm Rosado', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3110787142-espejo-para-maquillaje-espejo-doble-de-mesa-con-aumento-36cm-rosado-_JM', 'http://http2.mlstatic.com/D_710135-MLA99605599942_122025-I.jpg', 'MLC431591', '2025-09-01T23:45:42.804Z'::timestamptz, '2026-01-21T16:44:25.520Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678060473', 'FWEM13644', 'Batidora Pedestal Planetaria Th-911b Color Blanco', 72990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678060473-batidora-pedestal-planetaria-th-911b-color-blanco-_JM', 'http://http2.mlstatic.com/D_986683-MLA100012298393_122025-I.jpg', 'MLC440064', '2025-08-22T18:43:33.225Z'::timestamptz, '2026-01-21T16:34:11.609Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1687055461', 'JNTV41221', 'Pack 4 Barra De Proteina Twenty Hazelnut Praline Yourgoal', 8450, 69, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1687055461-pack-4-barra-de-proteina-twenty-hazelnut-praline-yourgoal-_JM', 'http://http2.mlstatic.com/D_763122-MLC91443612355_092025-I.jpg', 'MLC376470', '2025-09-01T20:26:42.149Z'::timestamptz, '2026-02-05T21:32:11.317Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114640244', 'HUQH61716', 'Indigo Estrella Nocturna 100g Blends And Tea', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114640244-indigo-estrella-nocturna-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_746894-MLC91943970343_092025-I.jpg', 'MLC178668', '2025-09-02T23:05:47.080Z'::timestamptz, '2026-01-21T16:44:23.515Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678022001', 'ZDPH13001', 'Secador De Pelo Siegen Sg-3005 Pocket Color Negro Negro', 10311, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678022001-secador-de-pelo-siegen-sg-3005-pocket-color-negro-negro-_JM', 'http://http2.mlstatic.com/D_828125-MLA84549612690_052025-I.jpg', 'MLC4597', '2025-08-22T18:46:45.141Z'::timestamptz, '2026-01-22T13:20:29.018Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3108109514', 'YVZG45551', 'Citrato De Magensio + Citrato De Potasio 1 Kilo En Polvo Sab - Propio', 26490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3108109514-citrato-de-magensio-citrato-de-potasio-1-kilo-en-polvo-sab-propio-_JM', 'http://http2.mlstatic.com/D_871215-MLC90905025450_082025-I.jpg', 'MLC435304', '2025-08-29T23:36:53.534Z'::timestamptz, '2026-02-04T19:21:59.915Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678034873', 'FNPO99381', 'Trimmer Siegen Sg-8011 2en 1 Color Negro', 9262, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678034873-trimmer-siegen-sg-8011-2en-1-color-negro-_JM', 'http://http2.mlstatic.com/D_979756-MLC90376528736_082025-I.jpg', 'MLC5411', '2025-08-22T18:40:35.943Z'::timestamptz, '2026-01-21T16:44:20.224Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114640314', 'XZBN07681', 'Pink Detox 50g Blends And Tea', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114640314-pink-detox-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_933674-MLC91546007592_092025-I.jpg', 'MLC178668', '2025-09-02T23:11:20.249Z'::timestamptz, '2026-01-21T16:44:28.083Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1686875147', 'JNTV41213', 'Barras De Proteina Twenty''s Sabor Chocolate Brownie Pack 4 Barritas 60g C/u Yourgoal Nutrition Suplemento Con Proteina', 8990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1686875147-barras-de-proteina-twentys-sabor-chocolate-brownie-pack-4-barritas-60g-cu-yourgoal-nutrition-suplemento-con-proteina-_JM', 'http://http2.mlstatic.com/D_879006-MLA99402701528_112025-I.jpg', 'MLC376470', '2025-09-01T20:22:50.309Z'::timestamptz, '2026-01-21T16:44:29.054Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1686913869', 'EICE39558', 'Box 4 Barras Twentys Chocolate Fudge - Your Goal Chocolate Fudge', 8980, 55, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1686913869-box-4-barras-twentys-chocolate-fudge-your-goal-chocolate-fudge-_JM', 'http://http2.mlstatic.com/D_881782-MLC91443680713_092025-I.jpg', 'MLC435304', '2025-09-01T20:25:17.847Z'::timestamptz, '2026-02-05T22:40:00.024Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1686952543', 'RIUC40905', 'Your Goal Barras De Proteína Lemon Cheesecake Sin Gluten X4', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1686952543-your-goal-barras-de-proteina-lemon-cheesecake-sin-gluten-x4-_JM', 'http://http2.mlstatic.com/D_831376-MLA105989558207_012026-I.jpg', 'MLC435304', '2025-09-01T20:24:13.745Z'::timestamptz, '2026-01-27T22:33:19.064Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1686939469', 'JNTV41213', 'Pack 4 Barras De Proteina Twenty Chocolate Brownie', 8990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1686939469-pack-4-barras-de-proteina-twenty-chocolate-brownie-_JM', 'http://http2.mlstatic.com/D_908513-MLC91444125751_092025-I.jpg', 'MLC376470', '2025-09-01T20:22:49.779Z'::timestamptz, '2026-01-21T16:44:34.792Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1686913839', 'RIUC40905', 'Pack 4 Barra De Proteina Twenty Lemon Cheesecake Lemon Cheesecake', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1686913839-pack-4-barra-de-proteina-twenty-lemon-cheesecake-lemon-cheesecake-_JM', 'http://http2.mlstatic.com/D_633418-MLC91051233408_092025-I.jpg', 'MLC435304', '2025-09-01T20:24:13.133Z'::timestamptz, '2026-01-27T13:28:38.321Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1678021959', 'PUVI99334', 'Ondulador Siegen Sg-2420 Cilindro 33mm Color Negro', 14019, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1678021959-ondulador-siegen-sg-2420-cilindro-33mm-color-negro-_JM', 'http://http2.mlstatic.com/D_671096-MLC49899032000_052022-I.jpg', 'MLC440077', '2025-08-22T18:41:57.076Z'::timestamptz, '2026-01-21T16:44:33.540Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114576206', 'GJRN08564', 'Indigo Estrella Nocturna 60g Blends And Tea', 12990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114576206-indigo-estrella-nocturna-60g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_705035-MLC91545368228_092025-I.jpg', 'MLC178668', '2025-09-02T23:04:57.073Z'::timestamptz, '2026-01-25T09:35:38.433Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114563012', 'WXAY08322', 'Hibisco Sueño Profundo 100g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114563012-hibisco-sueno-profundo-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_703829-MLC91942334557_092025-I.jpg', 'MLC178668', '2025-09-02T22:57:25.565Z'::timestamptz, '2026-01-31T00:28:44.593Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114473772', 'LPDY07647', 'Rooibos Relax 100g Recarga Blends And Tea', 9990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114473772-rooibos-relax-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_910091-MLC91144842456_092025-I.jpg', 'MLC178668', '2025-09-03T00:04:30.753Z'::timestamptz, '2026-01-24T15:40:17.764Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114538510', 'EICE61553', 'Rooibos Relax 50g Blends And Tea', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114538510-rooibos-relax-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_939162-MLC91144920216_092025-I.jpg', 'MLC178668', '2025-09-02T23:59:45.029Z'::timestamptz, '2026-01-21T16:44:31.307Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114524222', 'OBNV60900', 'Indigo Estrella Nocturna 40g Blends And Tea', 9990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114524222-indigo-estrella-nocturna-40g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_774968-MLC91545356572_092025-I.jpg', 'MLC178668', '2025-09-02T23:04:12.192Z'::timestamptz, '2026-01-24T03:26:03.832Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114486952', 'XIMQ60111', 'Infusion Sirio Dulces Sueños 35g Recarga Blends And Tea', 7990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114486952-infusion-sirio-dulces-suenos-35g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_976458-MLC91145915376_092025-I.jpg', 'MLC178668', '2025-09-03T00:11:19.828Z'::timestamptz, '2026-01-31T18:54:02.978Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114537172', 'HUQH61737', 'Hibisco Sueño Profundo 150g Blends And Tea', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114537172-hibisco-sueno-profundo-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_671884-MLC91942971375_092025-I.jpg', 'MLC178668', '2025-09-02T22:58:15.320Z'::timestamptz, '2026-01-21T16:44:32.051Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114537386', 'HUQH61632', 'Purpura Detox 150g Blends And Tea', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114537386-purpura-detox-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_869216-MLC91537744785_092025-I.jpg', 'MLC178668', '2025-09-02T23:16:00.837Z'::timestamptz, '2026-01-21T16:44:20.273Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114486880', 'VBJI08615', 'Rooibos Relax 100g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114486880-rooibos-relax-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_639095-MLC91144751490_092025-I.jpg', 'MLC178668', '2025-09-03T00:00:34.611Z'::timestamptz, '2026-01-21T16:44:22.436Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114537112', 'BXBT08276', 'Infusión Azul Relajante 100g Recarga Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114537112-infusion-azul-relajante-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_687553-MLC91543206914_092025-I.jpg', 'MLC178668', '2025-09-02T22:52:24.818Z'::timestamptz, '2026-02-04T17:05:36.221Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114549828', 'FUNL08615', 'Infusión Azul Relajante 100g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114549828-infusion-azul-relajante-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_624541-MLC91143485424_092025-I.jpg', 'MLC178668', '2025-09-02T22:47:04.562Z'::timestamptz, '2026-01-21T16:44:21.081Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114472620', 'ROSW08092', 'Indigo Estrella Nocturna 35g Recarga Blends And Tea', 7990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114472620-indigo-estrella-nocturna-35g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_720152-MLC91537181095_092025-I.jpg', 'MLC178668', '2025-09-02T23:07:48.589Z'::timestamptz, '2026-01-30T22:37:47.080Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114523712', 'BXBT08282', 'Golden Milk 150g Recarga Blends And Tea Curcuma', 11990, 16, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114523712-golden-milk-150g-recarga-blends-and-tea-curcuma-_JM', 'http://http2.mlstatic.com/D_623287-MLC91142500002_092025-I.jpg', 'MLC178668', '2025-09-02T22:14:39.310Z'::timestamptz, '2026-02-05T02:55:14.820Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114601822', 'AIOW07986', 'Infusión Azul Relajante 50g', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114601822-infusion-azul-relajante-50g-_JM', 'http://http2.mlstatic.com/D_732190-MLC91142982384_092025-I.jpg', 'MLC178668', '2025-09-02T22:42:34.768Z'::timestamptz, '2026-01-21T16:34:18.425Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114588972', 'QVVJ61083', 'Purpura Detox 100g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114588972-purpura-detox-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_755701-MLC91944701397_092025-I.jpg', 'MLC178668', '2025-09-02T23:14:52.019Z'::timestamptz, '2026-01-21T16:44:34.297Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114588654', 'BPUI08063', 'Infusión Azul Relajante 150g Blends And Tea', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114588654-infusion-azul-relajante-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_672757-MLC91940824189_092025-I.jpg', 'MLC178668', '2025-09-02T22:47:58.967Z'::timestamptz, '2026-01-21T16:44:16.110Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114485416', 'FTNE62064', 'Infusión Armonía Fase Menstrual 150g Blends And Tea', 19990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114485416-infusion-armonia-fase-menstrual-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_762479-MLC91142956136_092025-I.jpg', 'MLC178668', '2025-09-02T22:26:47.510Z'::timestamptz, '2026-01-24T04:12:01.960Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114486934', 'FUNL08461', 'Infusion Sirio Dulces Sueños 60g Blends And Tea', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114486934-infusion-sirio-dulces-suenos-60g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_997006-MLC91144803944_092025-I.jpg', 'MLC178668', '2025-09-03T00:08:04.068Z'::timestamptz, '2026-01-29T02:38:51.285Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114537446', 'WIPD08118', 'Purpura Detox 100g Recarga Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114537446-purpura-detox-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_764879-MLC91945695077_092025-I.jpg', 'MLC178668', '2025-09-02T23:20:25.535Z'::timestamptz, '2026-02-04T17:06:06.143Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114472532', 'LQAJ07509', 'Hibisco Sueño Profundo 100g Recarga Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114472532-hibisco-sueno-profundo-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_830331-MLC91143510886_092025-I.jpg', 'MLC178668', '2025-09-02T23:00:24.280Z'::timestamptz, '2026-02-04T17:07:43.635Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114472506', 'RWDD08085', 'Hibisco Sueño Profundo 50g Blends And Tea', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114472506-hibisco-sueno-profundo-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_708789-MLC91544008366_092025-I.jpg', 'MLC178668', '2025-09-02T22:56:19.952Z'::timestamptz, '2026-01-21T16:44:34.283Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117051682', 'TXMW07827', 'Te Fucsia 100g Recarga Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117051682-te-fucsia-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_861593-MLC91606594185_092025-I.jpg', 'MLC178668', '2025-09-03T23:43:00.902Z'::timestamptz, '2026-02-04T17:06:24.958Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114472312', 'WXAY08346', 'Infusión Armonía Fase Menstrual 100g Recarga', 9990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114472312-infusion-armonia-fase-menstrual-100g-recarga-_JM', 'http://http2.mlstatic.com/D_823762-MLC91648082865_092025-I.jpg', 'MLC178668', '2025-09-02T22:37:39.858Z'::timestamptz, '2026-01-30T22:37:42.979Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1688079279', 'CWIW08419', 'Te Blanco Chai 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1688079279-te-blanco-chai-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_641643-MLC91542993443_092025-I.jpg', 'MLC178668', '2025-09-03T02:40:26.882Z'::timestamptz, '2026-01-21T16:44:20.074Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117625958', 'VIHH07482', 'Te Verde Detox 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117625958-te-verde-detox-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_623817-MLC91645563073_092025-I.jpg', 'MLC178668', '2025-09-04T16:42:50.984Z'::timestamptz, '2026-01-21T16:34:11.166Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3116896852', 'VJJA60937', 'Te Negro Masala Chai 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3116896852-te-negro-masala-chai-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_728463-MLC91607297807_092025-I.jpg', 'MLC178668', '2025-09-03T23:57:40.872Z'::timestamptz, '2026-01-21T16:44:29.338Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3114447200', 'HZDV08419', 'Infusión Armonía Fase Menstrual 50g Blends And Tea', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3114447200-infusion-armonia-fase-menstrual-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_974249-MLC91937885687_092025-I.jpg', 'MLC178668', '2025-09-02T22:25:52.891Z'::timestamptz, '2026-01-21T16:44:16.579Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117115248', 'RBAT62784', 'Te Blanco Manzana Y Frutilla 100g Recarga Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117115248-te-blanco-manzana-y-frutilla-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_940389-MLC91211459830_092025-I.jpg', 'MLC178668', '2025-09-03T23:15:32.015Z'::timestamptz, '2026-02-04T17:04:46.515Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117050472', 'WVIV08187', 'Te Blanco Manzana Y Frutilla 50g Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117050472-te-blanco-manzana-y-frutilla-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_752350-MLC91211258342_092025-I.jpg', 'MLC178668', '2025-09-03T23:06:46.613Z'::timestamptz, '2026-01-21T16:44:27.707Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3116896086', 'IEMB61530', 'Te Fucsia 50g Blends And Tea', 7990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3116896086-te-fucsia-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_699438-MLC91606447545_092025-I.jpg', 'MLC178668', '2025-09-03T23:24:29.650Z'::timestamptz, '2026-01-21T16:53:22.382Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3116884272', 'KEIU08016', 'Te Negro Cacao 50g Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3116884272-te-negro-cacao-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_643485-MLC91212358204_092025-I.jpg', 'MLC178668', '2025-09-03T23:49:09.573Z'::timestamptz, '2026-01-21T16:34:14.919Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1687962995', 'UVJP08063', 'Te Blanco Chai 50g Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1687962995-te-blanco-chai-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_689929-MLC91543080303_092025-I.jpg', 'MLC178668', '2025-09-03T02:36:04.862Z'::timestamptz, '2026-01-21T16:44:22.479Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1688053665', 'EKVC07725', 'Te Blanco Chai 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1688053665-te-blanco-chai-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_670927-MLC91149630344_092025-I.jpg', 'MLC178668', '2025-09-03T02:39:18.509Z'::timestamptz, '2026-01-21T16:44:24.251Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1687932313', 'HOEK07513', 'Matcha Blue 50g Recarga Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1687932313-matcha-blue-50g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_888623-MLC91562330676_092025-I.jpg', 'MLC178668', '2025-09-03T00:17:52.138Z'::timestamptz, '2026-01-21T16:44:15.103Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117141510', 'KPVG07815', 'Te Fucsia 100g Blends And Tea', 11990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117141510-te-fucsia-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_783765-MLC91606390023_092025-I.jpg', 'MLC178668', '2025-09-03T23:25:16.346Z'::timestamptz, '2026-01-21T16:43:08.636Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1687893833', 'NQBK62980', 'Infusion Sirio Dulces Sueños 100g Blends And Tea', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1687893833-infusion-sirio-dulces-suenos-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_948451-MLC91538725129_092025-I.jpg', 'MLC178668', '2025-09-03T00:08:55.052Z'::timestamptz, '2026-01-21T16:44:33.491Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3116896774', 'FWEM62347', 'Te Negro Cacao 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3116896774-te-negro-cacao-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_627630-MLC91212269980_092025-I.jpg', 'MLC178668', '2025-09-03T23:49:58.955Z'::timestamptz, '2026-01-21T16:44:24.665Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1687989255', 'JUET61684', 'Te Blanco Chai 100g Recarga Blends And Tea', 6990, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1687989255-te-blanco-chai-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_992486-MLC91150745088_092025-I.jpg', 'MLC178668', '2025-09-03T02:45:04.991Z'::timestamptz, '2026-02-05T00:25:52.061Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117013490', 'YKHD07804', 'Te Negro Cacao 100g Recarga Blends And Tea', 6990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3117013490-te-negro-cacao-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_651394-MLC91212252752_092025-I.jpg', 'MLC178668', '2025-09-03T23:54:49.809Z'::timestamptz, '2026-01-21T16:44:29.325Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3116934362', 'PEUJ08282', 'Te Blanco Manzana Y Frutilla 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3116934362-te-blanco-manzana-y-frutilla-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_815343-MLC91210973120_092025-I.jpg', 'MLC178668', '2025-09-03T23:07:49.209Z'::timestamptz, '2026-01-21T16:44:29.553Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117614260', 'HIKE08380', 'Té Verde Menta - Frutilla 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117614260-te-verde-menta-frutilla-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_666505-MLC91646335271_092025-I.jpg', 'MLC178668', '2025-09-04T16:52:15.920Z'::timestamptz, '2026-01-21T16:44:30.138Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689085407', 'UCUH62029', 'Te Pu-erh Naranja 100g Recarga Blends And Tea', 6990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689085407-te-pu-erh-naranja-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_776621-MLC91249858436_092025-I.jpg', 'MLC178668', '2025-09-04T16:38:38.554Z'::timestamptz, '2026-01-30T22:37:45.841Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689137437', 'XUWL07836', 'Te Verde Detox 100g Recarga Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689137437-te-verde-detox-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_844872-MLC91250118938_092025-I.jpg', 'MLC178668', '2025-09-04T16:47:37.083Z'::timestamptz, '2026-02-04T17:05:07.722Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117437860', 'WMPT07870', 'Te Oolong Jengibre Limon 100g Recarga Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117437860-te-oolong-jengibre-limon-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_930485-MLC91248188516_092025-I.jpg', 'MLC178668', '2025-09-04T16:01:02.643Z'::timestamptz, '2026-01-21T16:44:20.268Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689362583', 'DEBU07858', 'Te Verde Detox 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689362583-te-verde-detox-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_774185-MLC91645553127_092025-I.jpg', 'MLC178668', '2025-09-04T16:43:29.552Z'::timestamptz, '2026-01-21T16:34:13.499Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689375187', 'ZMRD60577', 'Te Verde Detox 50g Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689375187-te-verde-detox-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_891882-MLC91249502676_092025-I.jpg', 'MLC178668', '2025-09-04T16:42:01.306Z'::timestamptz, '2026-01-21T16:44:25.545Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689072239', 'BVET61548', 'Te Oolong Manzana Canela 100g Recarga Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689072239-te-oolong-manzana-canela-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_635056-MLC91644689005_092025-I.jpg', 'MLC178668', '2025-09-04T16:21:07.858Z'::timestamptz, '2026-01-21T16:57:05.992Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689059043', 'TXCY07929', 'Te Oolong Manzana Canela 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689059043-te-oolong-manzana-canela-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_737820-MLC91248381264_092025-I.jpg', 'MLC178668', '2025-09-04T16:13:34.867Z'::timestamptz, '2026-01-21T16:53:02.188Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689124437', 'KHMN08517', 'Te Pu-erh Rosas 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689124437-te-pu-erh-rosas-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_747294-MLC91645385395_092025-I.jpg', 'MLC178668', '2025-09-04T16:25:53.618Z'::timestamptz, '2026-01-21T16:56:16.592Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689085649', 'OABP62249', 'Té Verde Menta - Frutilla 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689085649-te-verde-menta-frutilla-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_880285-MLC91249884700_092025-I.jpg', 'MLC178668', '2025-09-04T16:51:28.663Z'::timestamptz, '2026-01-21T16:34:09.234Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689362349', 'NDBU08796', 'Te Pu-erh Rosas 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689362349-te-pu-erh-rosas-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_851250-MLC91249365394_092025-I.jpg', 'MLC178668', '2025-09-04T16:25:10.766Z'::timestamptz, '2026-01-21T16:48:46.523Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689059791', 'BMZY08276', 'Té Verde Menta - Frutilla 100g Recarga Blends And Tea', 6990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689059791-te-verde-menta-frutilla-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_817856-MLC91646319813_092025-I.jpg', 'MLC178668', '2025-09-04T17:01:33.745Z'::timestamptz, '2026-01-31T17:04:57.520Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689085255', 'WLJX07149', 'Te Pu-erh Rosas 100g Recarga Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689085255-te-pu-erh-rosas-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_911940-MLC91645160157_092025-I.jpg', 'MLC178668', '2025-09-04T16:29:56.674Z'::timestamptz, '2026-01-21T18:03:40.895Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689097837', 'AYVA07787', 'Te Oolong Jengibre Limon 50g Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689097837-te-oolong-jengibre-limon-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_737371-MLC91643299555_092025-I.jpg', 'MLC178668', '2025-09-04T15:51:33.425Z'::timestamptz, '2026-01-21T16:34:15.483Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117476414', 'VQGV08037', 'Te Oolong Jengibre Limon 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117476414-te-oolong-jengibre-limon-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_864891-MLC91247829578_092025-I.jpg', 'MLC178668', '2025-09-04T15:56:13.893Z'::timestamptz, '2026-01-21T16:44:29.598Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689349077', 'TDHB62265', 'Te Oolong Manzana Canela 50g Blends And Tea', 6990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689349077-te-oolong-manzana-canela-50g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_653447-MLC91248777558_092025-I.jpg', 'MLC178668', '2025-09-04T16:12:51.344Z'::timestamptz, '2026-01-21T18:02:22.669Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3117536918', 'MMMQ07804', 'Te Pu-erh Naranja 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3117536918-te-pu-erh-naranja-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_904859-MLC91249875758_092025-I.jpg', 'MLC178668', '2025-09-04T16:33:38.093Z'::timestamptz, '2026-01-21T17:44:06.381Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689110567', 'SMRL61860', 'Te Oolong Jengibre Limon 100g Blends And Tea', 9990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689110567-te-oolong-jengibre-limon-100g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_635320-MLC91248195214_092025-I.jpg', 'MLC178668', '2025-09-04T15:55:35.816Z'::timestamptz, '2026-01-21T16:44:28.500Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689349479', 'OPGH61856', 'Te Pu-erh Naranja 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689349479-te-pu-erh-naranja-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_987437-MLC91645459343_092025-I.jpg', 'MLC178668', '2025-09-04T16:34:21.304Z'::timestamptz, '2026-01-21T16:57:46.116Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689123437', 'NLZC07407', 'Te Negro Masala Chai 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689123437-te-negro-masala-chai-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_741988-MLC91642888765_092025-I.jpg', 'MLC178668', '2025-09-04T15:43:41.898Z'::timestamptz, '2026-01-21T16:44:33.292Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3174762618', 'AKZZ08187', 'Naipe Ingles Cartas Inglesa Baraja Ingles Plastificado Poker Multicolor Baraja Inglés', 5000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3174762618-naipe-ingles-cartas-inglesa-baraja-ingles-plastificado-poker-multicolor-baraja-ingles-_JM', 'http://http2.mlstatic.com/D_906871-MLA92814518546_092025-I.jpg', 'MLC437050', '2025-09-24T03:41:55.624Z'::timestamptz, '2026-01-21T16:44:35.235Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3174074694', 'YRXY20666', 'Pack 10 Sobres Twopack (2 Figuras) Superzings Serie 4', 18990, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3174074694-pack-10-sobres-twopack-2-figuras-superzings-serie-4-_JM', 'http://http2.mlstatic.com/D_922909-MLC93222544239_092025-I.jpg', 'MLC3422', '2025-09-24T02:06:25.122Z'::timestamptz, '2026-02-04T12:45:57.088Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3134950270', 'WNOF68232', 'Te Hibisco Detox Vitalidad 150 Gr Blends & Tea', 14300, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3134950270-te-hibisco-detox-vitalidad-150-gr-blends-tea-_JM', 'http://http2.mlstatic.com/D_826126-MLA105565493201_012026-I.jpg', 'MLC178668', '2025-09-10T23:19:53.091Z'::timestamptz, '2026-01-26T12:45:29.761Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3173906610', 'JJDG20728', 'Caja Sellada 25 Sobres (1 Fig Por Sobre) Superzing Serie 4', 21200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3173906610-caja-sellada-25-sobres-1-fig-por-sobre-superzing-serie-4-_JM', 'http://http2.mlstatic.com/D_735914-MLC92811377030_092025-I.jpg', 'MLC3422', '2025-09-24T02:11:38.996Z'::timestamptz, '2026-01-29T18:04:48.793Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669277943', 'UHOF93248', 'Thomas Th-80n Cocedor De Huevos Color Negra Negro', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669277943-thomas-th-80n-cocedor-de-huevos-color-negra-negro-_JM', 'http://http2.mlstatic.com/D_990840-MLC89454601828_082025-I.jpg', 'MLC162504', '2025-08-10T18:49:36.186Z'::timestamptz, '2026-02-06T00:23:18.549Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3173887108', 'UVEZ18794', 'Pack 5 Blaster Jets + 5 Figuras Superzing Serie 4', 14990, 100, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3173887108-pack-5-blaster-jets-5-figuras-superzing-serie-4-_JM', 'http://http2.mlstatic.com/D_926064-MLC93210062965_092025-I.jpg', 'MLC3422', '2025-09-23T19:23:39.257Z'::timestamptz, '2026-02-05T17:26:13.270Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1703814075', 'TNHL20123', 'Caja 8 Megajets + 8 Figuras Superzing Serie 4', 24990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1703814075-caja-8-megajets-8-figuras-superzing-serie-4-_JM', 'http://http2.mlstatic.com/D_614733-MLC92774987866_092025-I.jpg', 'MLC3422', '2025-09-23T13:49:02.448Z'::timestamptz, '2026-01-24T14:57:18.342Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3176613118', 'HUQH74041', 'Crema Aclarante Vanilla Passion 105 Ml Ritzy Mash Sin Tono', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3176613118-crema-aclarante-vanilla-passion-105-ml-ritzy-mash-sin-tono-_JM', 'http://http2.mlstatic.com/D_794551-MLC93362781073_092025-I.jpg', 'MLC174669', '2025-09-25T01:18:00.589Z'::timestamptz, '2026-01-21T16:44:19.543Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3174055702', 'ULEP19975', 'Pack 2 Blaster Jets + 4 Superzings Serie 4', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3174055702-pack-2-blaster-jets-4-superzings-serie-4-_JM', 'http://http2.mlstatic.com/D_664723-MLC92798251578_092025-I.jpg', 'MLC3422', '2025-09-23T19:39:22.248Z'::timestamptz, '2026-01-21T16:44:31.265Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669075769', 'UHOF93248', 'Thomas Th-80n Cocedor De Huevos Color Negra', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669075769-thomas-th-80n-cocedor-de-huevos-color-negra-_JM', 'http://http2.mlstatic.com/D_931575-MLA99986095179_112025-I.jpg', 'MLC162504', '2025-08-10T18:49:36.674Z'::timestamptz, '2026-02-06T00:23:18.541Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1689058519', 'VFVU62518', 'Te Negro Masala Chai 100g Recarga Blends And Tea', 6990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1689058519-te-negro-masala-chai-100g-recarga-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_823499-MLC91247014596_092025-I.jpg', 'MLC178668', '2025-09-04T15:48:27.082Z'::timestamptz, '2026-01-27T09:46:15.586Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1703735977', 'TNHL20123', 'Caja 8 Megajets + 8 Figuras Superzing Serie 4', 24990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1703735977-caja-8-megajets-8-figuras-superzing-serie-4-_JM', 'http://http2.mlstatic.com/D_645454-MLA99977192731_112025-I.jpg', 'MLC3422', '2025-09-23T13:49:03.022Z'::timestamptz, '2026-01-24T14:57:18.353Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3174061226', 'NNUL19767', '9+1 Superzings Dorado Coleccionables Superzings Serie 4', 14400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3174061226-91-superzings-dorado-coleccionables-superzings-serie-4-_JM', 'http://http2.mlstatic.com/D_955918-MLC92809402512_092025-I.jpg', 'MLC3422', '2025-09-24T01:50:26.019Z'::timestamptz, '2026-01-21T16:34:15.023Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3121791366', 'VDRC07938', 'Creatina Monohidratada Creapure 300g Strive - Sin Sabor', 32243, 54, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3121791366-creatina-monohidratada-creapure-300g-strive-sin-sabor-_JM', 'http://http2.mlstatic.com/D_715656-MLC91348711114_092025-I.jpg', 'MLC435304', '2025-09-05T20:12:55.553Z'::timestamptz, '2026-02-05T16:57:14.890Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3174074946', 'JJDG20728', 'Figuritas Superzings One Serie 4', 21200, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3174074946-figuritas-superzings-one-serie-4-_JM', 'http://http2.mlstatic.com/D_973919-MLA99966210277_112025-I.jpg', 'MLC3422', '2025-09-24T02:11:39.592Z'::timestamptz, '2026-01-29T18:04:48.799Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3174055132', 'NBXJ20904', 'Pack 4 Megajets + 4 Figuras Superzing Serie 4', 13990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3174055132-pack-4-megajets-4-figuras-superzing-serie-4-_JM', 'http://http2.mlstatic.com/D_947706-MLC92797357082_092025-I.jpg', 'MLC455430', '2025-09-23T19:06:24.892Z'::timestamptz, '2026-01-24T14:59:39.384Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3173918828', 'BZSP19629', 'Super Zings Serie 4 Pack Inicial ( Comic + Pack Zings)', 6693, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3173918828-super-zings-serie-4-pack-inicial-comic-pack-zings-_JM', 'http://http2.mlstatic.com/D_786452-MLA99527731702_122025-I.jpg', 'MLC3422', '2025-09-24T01:55:25.290Z'::timestamptz, '2026-02-04T16:30:16.126Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3173945900', 'BJAF72982', 'Pack 10 Sobres (1 Fig Por Sobre) Superzings Serie 4', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3173945900-pack-10-sobres-1-fig-por-sobre-superzings-serie-4-_JM', 'http://http2.mlstatic.com/D_807340-MLC92811500376_092025-I.jpg', 'MLC3422', '2025-09-24T02:17:41.663Z'::timestamptz, '2026-01-29T22:06:31.883Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3137731242', 'LYSO13848', 'Separador De Servicios Organizador De Servicios O Cubiertos Color Blanco', 4600, 55, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3137731242-separador-de-servicios-organizador-de-servicios-o-cubiertos-color-blanco-_JM', 'http://http2.mlstatic.com/D_851974-MLA100075137589_122025-I.jpg', 'MLC436420', '2025-09-11T12:15:22.491Z'::timestamptz, '2026-02-05T12:14:15.724Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3173944846', 'BZSP19629', 'Superzings Serie 4 Pack (comic + Megajet + 2 Fig + Bolsa)', 6693, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3173944846-superzings-serie-4-pack-comic-megajet-2-fig-bolsa-_JM', 'http://http2.mlstatic.com/D_856450-MLC93222656929_092025-I.jpg', 'MLC3422', '2025-09-24T01:55:24.737Z'::timestamptz, '2026-02-04T16:30:16.126Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1708395147', 'HMQT30281', 'Uslero Madera Amasar Pan Postres Rodillo Reposteria Cocina', 3990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1708395147-uslero-madera-amasar-pan-postres-rodillo-reposteria-cocina-_JM', 'http://http2.mlstatic.com/D_733603-MLA104900891873_012026-I.jpg', 'MLC180827', '2025-09-28T14:15:22.860Z'::timestamptz, '2026-01-27T15:22:24.224Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3177982200', NULL, 'Caja 30 Unidades Chocolate Crunch 21g Proteina Yourgoal', 55990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3177982200-caja-30-unidades-chocolate-crunch-21g-proteina-yourgoal-_JM', 'http://http2.mlstatic.com/D_643972-MLC92954049200_092025-I.jpg', 'MLC376470', '2025-09-25T11:17:51.087Z'::timestamptz, '2026-01-21T16:34:20.634Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3177926422', 'GXDA20958', 'Citrato De Magnesio Puro En Polvo Doypack 100 Grs Sin Sabor Sin Sabor', 5090, 27, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3177926422-citrato-de-magnesio-puro-en-polvo-doypack-100-grs-sin-sabor-sin-sabor-_JM', 'http://http2.mlstatic.com/D_794852-MLC93390895725_092025-I.jpg', 'MLC435304', '2025-09-25T16:05:19.866Z'::timestamptz, '2026-02-04T01:34:21.507Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1708372845', NULL, 'Piso Bar De Madera Taburete De Madera Alto 69 Cm Liso Marrón', 19500, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1708372845-piso-bar-de-madera-taburete-de-madera-alto-69-cm-liso-marron-_JM', 'http://http2.mlstatic.com/D_890061-MLC93225093168_092025-I.jpg', 'MLC174452', '2025-09-28T16:30:45.366Z'::timestamptz, '2026-01-21T16:44:29.336Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3190473830', 'MXLE21547', 'Mascara Blueberry Iluminador Capilar 270 Ml Ritzy Mash', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3190473830-mascara-blueberry-iluminador-capilar-270-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_923432-MLA99355330866_112025-I.jpg', 'MLC1266', '2025-10-01T01:32:01.829Z'::timestamptz, '2026-02-05T00:32:04.836Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3181213354', 'FUNL64028', 'Caja Panera De Madera Con Tapa Enrollable Multiuso Grande Pino Madera', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3181213354-caja-panera-de-madera-con-tapa-enrollable-multiuso-grande-pino-madera-_JM', 'http://http2.mlstatic.com/D_994981-MLC94678432380_102025-I.jpg', 'MLC436311', '2025-09-28T11:51:48.128Z'::timestamptz, '2026-01-21T16:44:33.766Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1708386125', NULL, 'Taburete De Madera Piso Bar De Madera Bajo 49 Cm Madera Marrón', 18990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1708386125-taburete-de-madera-piso-bar-de-madera-bajo-49-cm-madera-marron-_JM', 'http://http2.mlstatic.com/D_602320-MLC95114256035_102025-I.jpg', 'MLC174452', '2025-09-28T16:40:34.438Z'::timestamptz, '2026-01-21T16:44:25.281Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3177903118', 'DEBU20697', 'Serum Todo Cabello Sin Enjuage Vanilla 30 Ml Ritzy Mash', 16990, 10, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3177903118-serum-todo-cabello-sin-enjuage-vanilla-30-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_808918-MLC93364582941_092025-I.jpg', 'MLC1266', '2025-09-25T10:38:27.732Z'::timestamptz, '2026-02-01T16:23:45.977Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3177954208', 'VEGG73728', 'Mascara Vanilla Passion Iluminador Capilar 270 Ml Ritzy Mash', 14990, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3177954208-mascara-vanilla-passion-iluminador-capilar-270-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_794745-MLC93360552641_092025-I.jpg', 'MLC1266', '2025-09-25T10:07:48.671Z'::timestamptz, '2026-01-29T08:24:01.118Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3177874818', 'GXDA20958', 'Citrato De Magnesio Puro En Polvo Doypack 100 Grs Sin Sabor', 5090, 27, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3177874818-citrato-de-magnesio-puro-en-polvo-doypack-100-grs-sin-sabor-_JM', 'http://http2.mlstatic.com/D_882020-MLA99844209707_112025-I.jpg', 'MLC435304', '2025-09-25T16:05:20.476Z'::timestamptz, '2026-02-04T01:34:21.513Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3190719304', 'UCKV21271', 'Shampoo Vanilla Passion Iluminador Capilar 270ml Ritzy Mash', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3190719304-shampoo-vanilla-passion-iluminador-capilar-270ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_976485-MLA99887309585_112025-I.jpg', 'MLC8163', '2025-10-01T01:32:24.172Z'::timestamptz, '2026-01-31T01:05:02.556Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1705391351', 'MXLE21547', 'Mascara Blueberry Iluminador Capilar 270 Ml Ritzy Mash', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1705391351-mascara-blueberry-iluminador-capilar-270-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_865561-MLC92905187216_092025-I.jpg', 'MLC1266', '2025-09-25T01:54:48.759Z'::timestamptz, '2026-02-05T00:32:04.837Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3177851214', 'FWEM75502', 'Serum Todo Cabello Sin Enjuage Blueberry 30 Ml Ritzy Mash', 16990, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3177851214-serum-todo-cabello-sin-enjuage-blueberry-30-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_681003-MLC93363076055_092025-I.jpg', 'MLC1266', '2025-09-25T10:16:24.226Z'::timestamptz, '2026-01-21T16:34:09.236Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1708460409', NULL, 'Tabla Para Picar De Madera Grande Gruesa 47x25x3,5 Lenga Lenga', 12990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1708460409-tabla-para-picar-de-madera-grande-gruesa-47x25x35-lenga-lenga-_JM', 'http://http2.mlstatic.com/D_603966-MLC95229026390_102025-I.jpg', 'MLC159275', '2025-09-28T14:31:06.061Z'::timestamptz, '2026-01-29T13:32:24.123Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3177838704', 'YVHL21791', 'Serum Todo Cabello Sin Enjuage Bubblegum 30 Ml Ritzy Mash', 16990, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3177838704-serum-todo-cabello-sin-enjuage-bubblegum-30-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_970497-MLC92951417408_092025-I.jpg', 'MLC1266', '2025-09-25T10:36:44.351Z'::timestamptz, '2026-01-21T16:44:29.320Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1704704317', 'HBSC73326', 'Shampoo Blueberry Iluminador Capilar 270ml Ritzy Mash', 14990, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1704704317-shampoo-blueberry-iluminador-capilar-270ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_955039-MLC93274067355_092025-I.jpg', 'MLC8163', '2025-09-24T11:41:39.841Z'::timestamptz, '2026-02-05T00:32:05.079Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1708628273', 'RRFW29107', 'Mortero De Madera Moledor De Hierbas Semillas Cocina Madera', 3990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1708628273-mortero-de-madera-moledor-de-hierbas-semillas-cocina-madera-_JM', 'http://http2.mlstatic.com/D_717183-MLA104900948255_012026-I.jpg', 'MLC159274', '2025-09-28T14:24:32.347Z'::timestamptz, '2026-02-01T22:28:34.403Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1704829705', 'XTCB19767', 'Cafeina Anhidra Sin Sabor 30 Caps 30 Porciones Zeo Sport Sin Sabor', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1704829705-cafeina-anhidra-sin-sabor-30-caps-30-porciones-zeo-sport-sin-sabor-_JM', 'http://http2.mlstatic.com/D_762949-MLC92902511720_092025-I.jpg', 'MLC435304', '2025-09-24T16:01:19.402Z'::timestamptz, '2026-01-21T16:44:16.334Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1704704493', 'UCKV21271', 'Shampoo Vanilla Passion Iluminador Capilar 270ml Ritzy Mash', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1704704493-shampoo-vanilla-passion-iluminador-capilar-270ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_966908-MLC93274057461_092025-I.jpg', 'MLC8163', '2025-09-24T11:47:49.705Z'::timestamptz, '2026-01-31T01:05:02.570Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1708579771', NULL, 'Piso Bar De Madera Taburete De Madera Alto 69 Cm Liso Marrón Oscuro', 19500, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1708579771-piso-bar-de-madera-taburete-de-madera-alto-69-cm-liso-marron-oscuro-_JM', 'http://http2.mlstatic.com/D_632427-MLC93226389524_092025-I.jpg', 'MLC174452', '2025-09-28T16:30:45.364Z'::timestamptz, '2026-01-21T16:49:08.215Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710684845', 'NQBK90779', 'Hervidor Thomas Th-6070vi 1,8 Litros Color Negro', 38400, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710684845-hervidor-thomas-th-6070vi-18-litros-color-negro-_JM', 'http://http2.mlstatic.com/D_761860-MLA95666829208_102025-I.jpg', 'MLC162504', '2025-10-01T13:39:00.244Z'::timestamptz, '2026-02-04T21:56:49.215Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710646589', NULL, 'Calienta Cama Siegen Sg-5121d5 2 Plazas (150 X 140 Cms) Colo', 69990, 1, 'under_review', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1710646589-calienta-cama-siegen-sg-5121d5-2-plazas-150-x-140-cms-colo-_JM', 'http://http2.mlstatic.com/D_923769-MLA93479240264_102025-I.jpg', 'MLC176930', '2025-10-01T13:56:12.131Z'::timestamptz, '2026-01-06T16:04:35.899Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710697999', NULL, 'Secador De Pelo Siegen Sg-3012 Negro', 13990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1710697999-secador-de-pelo-siegen-sg-3012-negro-_JM', 'http://http2.mlstatic.com/D_905982-MLA100001164595_112025-I.jpg', 'MLC4597', '2025-10-01T13:45:12.262Z'::timestamptz, '2026-01-21T16:44:27.110Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3191980970', 'HBSC73326', 'Shampoo Blueberry Iluminador Capilar 270ml Ritzy Mash', 14990, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3191980970-shampoo-blueberry-iluminador-capilar-270ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_874027-MLA99897264545_112025-I.jpg', 'MLC8163', '2025-10-01T14:13:40.338Z'::timestamptz, '2026-02-05T00:32:05.078Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710581099', 'DEBU20697', 'Serum Todo Cabello Sin Enjuage Vanilla 30 Ml Ritzy Mash', 16990, 10, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710581099-serum-todo-cabello-sin-enjuage-vanilla-30-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_760904-MLA99854867251_112025-I.jpg', 'MLC1266', '2025-10-01T10:19:39.821Z'::timestamptz, '2026-02-01T16:23:45.983Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710658915', NULL, 'Alisador Siegen Sg-4653 Placas Con Titanio', 65990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1710658915-alisador-siegen-sg-4653-placas-con-titanio-_JM', 'http://http2.mlstatic.com/D_758720-MLA99942131525_112025-I.jpg', 'MLC178457', '2025-10-01T13:42:16.164Z'::timestamptz, '2026-01-21T16:44:31.148Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710711573', 'AZKN35857', 'Multimixer Thomas Th-8706 Blanco', 18990, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710711573-multimixer-thomas-th-8706-blanco-_JM', 'http://http2.mlstatic.com/D_659407-MLC93479557144_102025-I.jpg', 'MLC429556', '2025-10-01T14:00:07.143Z'::timestamptz, '2026-02-05T23:42:14.988Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3192099632', 'YVHL21791', 'Serum Todo Cabello Sin Enjuage Bubblegum 30 Ml Ritzy Mash', 16990, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3192099632-serum-todo-cabello-sin-enjuage-bubblegum-30-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_791956-MLA99385987276_112025-I.jpg', 'MLC1266', '2025-10-01T15:09:14.001Z'::timestamptz, '2026-01-21T16:44:28.616Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710673607', 'XZEZ36219', 'Aspiradora Thomas Th-1220af Aquafilter Amarillo', 139990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710673607-aspiradora-thomas-th-1220af-aquafilter-amarillo-_JM', 'http://http2.mlstatic.com/D_801131-MLC93480461218_102025-I.jpg', 'MLC4337', '2025-10-01T14:21:50.985Z'::timestamptz, '2026-01-21T16:44:28.617Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710685563', 'AZKN35857', 'Multimixer Thomas Th-8706', 18990, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710685563-multimixer-thomas-th-8706-_JM', 'http://http2.mlstatic.com/D_758907-MLA94947498770_102025-I.jpg', 'MLC429556', '2025-10-01T14:00:07.713Z'::timestamptz, '2026-02-05T23:42:15.006Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710660395', 'XZEZ36219', 'Aspiradora Thomas Th-1220af Aquafilter', 139990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710660395-aspiradora-thomas-th-1220af-aquafilter-_JM', 'http://http2.mlstatic.com/D_871978-MLA100070901297_122025-I.jpg', 'MLC4337', '2025-10-01T14:21:51.610Z'::timestamptz, '2026-01-21T16:34:12.507Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710775847', 'NQBK90779', 'Hervidor Thomas Th-6070vi 1,8 Litros Color Negro - Negro', 38400, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710775847-hervidor-thomas-th-6070vi-18-litros-color-negro-negro-_JM', 'http://http2.mlstatic.com/D_889190-MLC93897682827_102025-I.jpg', 'MLC162504', '2025-10-01T13:38:59.649Z'::timestamptz, '2026-02-04T21:56:49.213Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710892881', 'XTCB19767', 'Cafeina Anhidra Sin Sabor 30 Caps 30 Porciones Zeo Sport Sin Sabor', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710892881-cafeina-anhidra-sin-sabor-30-caps-30-porciones-zeo-sport-sin-sabor-_JM', 'http://http2.mlstatic.com/D_840399-MLA99510806002_112025-I.jpg', 'MLC435304', '2025-10-02T00:56:38.140Z'::timestamptz, '2026-01-21T16:44:23.419Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710685409', NULL, 'Calienta Cama Siegen Sg-5121d5 2 Plazas (150 X 140 Cms) Color Blanco', 69990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1710685409-calienta-cama-siegen-sg-5121d5-2-plazas-150-x-140-cms-color-blanco-_JM', 'http://http2.mlstatic.com/D_853749-MLA99992562611_112025-I.jpg', 'MLC176930', '2025-10-01T13:56:12.706Z'::timestamptz, '2026-01-21T16:44:28.128Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710517921', 'ULEP19975', 'Pack 2 Blaster Jets + 4 Superzings Serie 4', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710517921-pack-2-blaster-jets-4-superzings-serie-4-_JM', 'http://http2.mlstatic.com/D_970307-MLA99389164000_112025-I.jpg', 'MLC3422', '2025-10-01T10:32:26.329Z'::timestamptz, '2026-01-21T16:44:22.124Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710854997', 'FWEM75502', 'Serum Todo Cabello Sin Enjuage Blueberry 30 Ml Ritzy Mash', 16990, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710854997-serum-todo-cabello-sin-enjuage-blueberry-30-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_719061-MLA99357693032_112025-I.jpg', 'MLC1266', '2025-10-01T14:22:54.338Z'::timestamptz, '2026-01-21T16:44:19.286Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3192534188', 'VEGG73728', 'Mascara Vanilla Passion Iluminador Capilar 270 Ml Ritzy Mash', 14990, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3192534188-mascara-vanilla-passion-iluminador-capilar-270-ml-ritzy-mash-_JM', 'http://http2.mlstatic.com/D_646472-MLA99858491483_112025-I.jpg', 'MLC1266', '2025-10-01T22:06:42.128Z'::timestamptz, '2026-01-29T01:00:00.465Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710762837', NULL, 'Alisador Siegen Sg-4653 Placas Con Titanio Café', 65990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1710762837-alisador-siegen-sg-4653-placas-con-titanio-cafe-_JM', 'http://http2.mlstatic.com/D_917244-MLC93897753807_102025-I.jpg', 'MLC178457', '2025-10-01T13:42:15.536Z'::timestamptz, '2026-01-21T16:44:27.509Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1711048433', 'AGOK00484', 'Canasto De Navidad Ceramica Viejito Pascuero Rojo', 6990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1711048433-canasto-de-navidad-ceramica-viejito-pascuero-rojo-_JM', 'http://http2.mlstatic.com/D_608677-MLC93964912201_102025-I.jpg', 'MLC440224', '2025-10-02T15:59:37.332Z'::timestamptz, '2026-01-21T16:44:21.107Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710620417', NULL, 'Secador De Pelo Siegen Sg-3012 Negro', 13990, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1710620417-secador-de-pelo-siegen-sg-3012-negro-_JM', 'http://http2.mlstatic.com/D_973279-MLC93478339490_102025-I.jpg', 'MLC4597', '2025-10-01T13:45:11.644Z'::timestamptz, '2026-01-21T16:44:31.168Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3196037304', 'EWAP36219', 'Aspiradora Thomas Th-2206bl Ciclónica - Blanco/turquesa', 88207, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3196037304-aspiradora-thomas-th-2206bl-ciclonica-blancoturquesa-_JM', 'http://http2.mlstatic.com/D_912903-MLC94073927535_102025-I.jpg', 'MLC4337', '2025-10-03T21:54:18.415Z'::timestamptz, '2026-01-21T16:34:11.504Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195959602', 'YQJG35992', 'Aspiradora Thomas Th-1407 1400w Color Gris - Gris Oscuro/negro', 47998, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195959602-aspiradora-thomas-th-1407-1400w-color-gris-gris-oscuronegro-_JM', 'http://http2.mlstatic.com/D_850584-MLC94074035431_102025-I.jpg', 'MLC4337', '2025-10-03T21:53:04.681Z'::timestamptz, '2026-01-21T16:44:29.471Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195947074', 'BVET88995', 'Alisador Siegen Sg-4751 Placas Con Titanio Marrón', 79400, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195947074-alisador-siegen-sg-4751-placas-con-titanio-marron-_JM', 'http://http2.mlstatic.com/D_671233-MLC94074103789_102025-I.jpg', 'MLC178457', '2025-10-03T22:16:12.759Z'::timestamptz, '2026-02-04T21:29:14.777Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195972578', 'IYST34763', 'Aspiradora Trineo Thomas Th-1415 3l Blanca 50hz/60hz Blanco', 58180, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195972578-aspiradora-trineo-thomas-th-1415-3l-blanca-50hz60hz-blanco-_JM', 'http://http2.mlstatic.com/D_872302-MLA99415095430_112025-I.jpg', 'MLC4337', '2025-10-03T21:47:32.531Z'::timestamptz, '2026-01-21T16:34:18.087Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195972448', 'XREQ36196', 'Horno Electrico Thomas Th-100i 100 Litros Color Plateado', 234990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195972448-horno-electrico-thomas-th-100i-100-litros-color-plateado-_JM', 'http://http2.mlstatic.com/D_866467-MLC93650609934_102025-I.jpg', 'MLC30854', '2025-10-03T21:39:40.908Z'::timestamptz, '2026-02-05T13:40:31.332Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195972852', 'YJIH36430', 'Alisador Siegen Sg-4651 Placas Con Titanio Rojo', 63900, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195972852-alisador-siegen-sg-4651-placas-con-titanio-rojo-_JM', 'http://http2.mlstatic.com/D_772724-MLC94074857091_102025-I.jpg', 'MLC178457', '2025-10-03T22:17:22.413Z'::timestamptz, '2026-02-04T15:20:57.243Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195998252', 'KXUD90324', 'Horno Eléctrico 16lt Th-16n01 Thomas Negro', 46812, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195998252-horno-electrico-16lt-th-16n01-thomas-negro-_JM', 'http://http2.mlstatic.com/D_620356-MLC93649731152_102025-I.jpg', 'MLC30854', '2025-10-03T21:23:44.098Z'::timestamptz, '2026-01-21T16:44:30.585Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710983057', 'MKVM00432', 'Bombonera De Navidad Caramelera De Navidad 3 Litros Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710983057-bombonera-de-navidad-caramelera-de-navidad-3-litros-rojo-_JM', 'http://http2.mlstatic.com/D_908358-MLC99490499543_112025-I.jpg', 'MLC413490', '2025-10-02T15:34:24.593Z'::timestamptz, '2026-01-21T16:34:14.576Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195985646', 'GRVV36261', 'Multimixer Thomas Th-8725 Color Blanco Blanco', 32400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195985646-multimixer-thomas-th-8725-color-blanco-blanco-_JM', 'http://http2.mlstatic.com/D_949536-MLC94074095747_102025-I.jpg', 'MLC429556', '2025-10-03T21:55:40.474Z'::timestamptz, '2026-02-05T23:04:01.782Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3196011656', 'YJIH36430', 'Alisador Siegen Sg-4651 Placas Con Titanio', 63900, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3196011656-alisador-siegen-sg-4651-placas-con-titanio-_JM', 'http://http2.mlstatic.com/D_935453-MLA99523945782_122025-I.jpg', 'MLC178457', '2025-10-03T22:17:23.023Z'::timestamptz, '2026-02-04T15:20:57.244Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195985562', NULL, 'Parrilla Eléctrica Thomas Th-224 1650w Color Negro', 58900, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3195985562-parrilla-electrica-thomas-th-224-1650w-color-negro-_JM', 'http://http2.mlstatic.com/D_623965-MLA96075368835_102025-I.jpg', 'MLC174449', '2025-10-03T21:45:34.517Z'::timestamptz, '2026-01-21T16:44:28.327Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195998306', 'MMMQ36067', 'Microondas Thomas Th-20s01 Manual 20 Litros', 69520, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195998306-microondas-thomas-th-20s01-manual-20-litros-_JM', 'http://http2.mlstatic.com/D_897576-MLC93649654578_102025-I.jpg', 'MLC30848', '2025-10-03T21:28:44.167Z'::timestamptz, '2026-01-21T16:44:28.366Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3196049900', 'KXUD90324', 'Horno Eléctrico 16lt Th-16n01 Thomas', 46812, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3196049900-horno-electrico-16lt-th-16n01-thomas-_JM', 'http://http2.mlstatic.com/D_989621-MLA87770690260_072025-I.jpg', 'MLC30854', '2025-10-03T21:23:44.693Z'::timestamptz, '2026-01-21T16:34:17.664Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3196037030', 'DDKG89386', 'Aspiradora De Tacho Thomas Junior Th-1516 16l', 106990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3196037030-aspiradora-de-tacho-thomas-junior-th-1516-16l-_JM', 'http://http2.mlstatic.com/D_990928-MLA99950928013_112025-I.jpg', 'MLC4337', '2025-10-03T21:25:48.514Z'::timestamptz, '2026-01-21T16:34:16.404Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3196049956', 'SGGT35202', 'Batidora Eléctrica Thomas Th-910pn Pedestal Negra Negro 50 Hz X 60 Hz', 88207, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3196049956-batidora-electrica-thomas-th-910pn-pedestal-negra-negro-50-hz-x-60-hz-_JM', 'http://http2.mlstatic.com/D_634258-MLC94072797267_102025-I.jpg', 'MLC440064', '2025-10-03T21:30:27.757Z'::timestamptz, '2026-02-05T00:22:27.669Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195985306', 'WLJX34785', 'Alisador Siegen Sg-3540 Cerámica + Tourmalina Púrpura', 37900, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195985306-alisador-siegen-sg-3540-ceramica-tourmalina-purpura-_JM', 'http://http2.mlstatic.com/D_801808-MLC93649728522_102025-I.jpg', 'MLC178457', '2025-10-03T21:18:13.562Z'::timestamptz, '2026-02-04T15:20:33.558Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195985586', 'IYST34763', 'Aspiradora Trineo Thomas Th-1415 3l Blanca 50hz/60hz - Blanco', 58180, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195985586-aspiradora-trineo-thomas-th-1415-3l-blanca-50hz60hz-blanco-_JM', 'http://http2.mlstatic.com/D_666925-MLC93650683586_102025-I.jpg', 'MLC4337', '2025-10-03T21:47:31.852Z'::timestamptz, '2026-01-21T16:44:23.544Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710905583', 'SEJB00547', 'Soporte De Botella Navidad Viejo Pascuero Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710905583-soporte-de-botella-navidad-viejo-pascuero-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_865789-MLC93964837695_102025-I.jpg', 'MLC417395', '2025-10-02T15:49:06.643Z'::timestamptz, '2026-01-21T16:44:20.287Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195972344', 'HOOO89270', 'Licuadora Portátil Thomas Personal Blender Th-300pb 600 Ml Inox Con Jarra De Plástico', 33600, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195972344-licuadora-portatil-thomas-personal-blender-th-300pb-600-ml-inox-con-jarra-de-plastico-_JM', 'http://http2.mlstatic.com/D_626739-MLA99508216660_112025-I.jpg', 'MLC180819', '2025-10-03T21:27:49.044Z'::timestamptz, '2026-02-05T21:22:14.314Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1710970217', 'XREQ69051', 'Bombonera De Navidad Caramelera De Ceramica 3l Pascuero Rojo', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1710970217-bombonera-de-navidad-caramelera-de-ceramica-3l-pascuero-rojo-_JM', 'http://http2.mlstatic.com/D_910014-MLC93543759976_102025-I.jpg', 'MLC413490', '2025-10-02T15:44:23.356Z'::timestamptz, '2026-01-21T16:34:13.522Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195908052', 'BVET88995', 'Alisador Siegen Sg-4751 Placas Con Titanio', 79400, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195908052-alisador-siegen-sg-4751-placas-con-titanio-_JM', 'http://http2.mlstatic.com/D_876722-MLA99881408805_112025-I.jpg', 'MLC178457', '2025-10-03T22:16:13.379Z'::timestamptz, '2026-02-04T21:29:14.767Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195946546', 'MLNA36328', 'Secador De Pelo Siegen Sg-3035 Color Negro', 19500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195946546-secador-de-pelo-siegen-sg-3035-color-negro-_JM', 'http://http2.mlstatic.com/D_893126-MLA99963843151_112025-I.jpg', 'MLC4597', '2025-10-03T21:22:46.348Z'::timestamptz, '2026-02-05T20:52:25.004Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1711881829', 'DXLS34989', 'Hervidor Thomas Th-4515n 2 Litros', 21771, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1711881829-hervidor-thomas-th-4515n-2-litros-_JM', 'http://http2.mlstatic.com/D_973059-MLA99502431956_112025-I.jpg', 'MLC162504', '2025-10-03T21:31:28.715Z'::timestamptz, '2026-02-06T01:10:19.659Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195881592', 'HOOO89270', 'Licuadora Portátil Thomas Personal Blender Th-300pb 600 Ml I Inox', 33600, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195881592-licuadora-portatil-thomas-personal-blender-th-300pb-600-ml-i-inox-_JM', 'http://http2.mlstatic.com/D_830447-MLC94072795905_102025-I.jpg', 'MLC180819', '2025-10-03T21:27:48.432Z'::timestamptz, '2026-02-05T21:22:14.313Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195881576', 'DDKG89386', 'Aspiradora De Tacho Thomas Junior Th-1516 16l Negro/rojo', 106990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195881576-aspiradora-de-tacho-thomas-junior-th-1516-16l-negrorojo-_JM', 'http://http2.mlstatic.com/D_838072-MLC93649742362_102025-I.jpg', 'MLC4337', '2025-10-03T21:25:47.888Z'::timestamptz, '2026-01-21T16:44:30.150Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195868696', 'XREQ36196', 'Horno Electrico Thomas Th-100i 100 Litros Color Plateado', 234990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195868696-horno-electrico-thomas-th-100i-100-litros-color-plateado-_JM', 'http://http2.mlstatic.com/D_713522-MLA99452908812_112025-I.jpg', 'MLC30854', '2025-10-03T21:39:41.500Z'::timestamptz, '2026-02-05T13:40:31.333Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195946972', 'TXCY35680', 'Secador De Pelo Siegen Sg-3049c01 Color Fucsia Fucsia', 26400, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195946972-secador-de-pelo-siegen-sg-3049c01-color-fucsia-fucsia-_JM', 'http://http2.mlstatic.com/D_815000-MLC93651354502_102025-I.jpg', 'MLC4597', '2025-10-03T22:06:04.334Z'::timestamptz, '2026-02-04T23:19:01.183Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195933556', 'MMMQ36067', 'Microondas Thomas Th-20s01 Manual 20 Litros', 69520, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195933556-microondas-thomas-th-20s01-manual-20-litros-_JM', 'http://http2.mlstatic.com/D_667951-MLA99514926506_112025-I.jpg', 'MLC30848', '2025-10-03T21:28:44.820Z'::timestamptz, '2026-01-21T16:44:33.777Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195868856', 'GRVV36261', 'Multimixer Thomas Th-8725 Color Blanco', 32400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195868856-multimixer-thomas-th-8725-color-blanco-_JM', 'http://http2.mlstatic.com/D_742130-MLA100063226031_122025-I.jpg', 'MLC429556', '2025-10-03T21:55:41.038Z'::timestamptz, '2026-02-05T23:04:01.777Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195907650', 'DXLS34989', 'Hervidor Thomas Th-4515n 2 Litros - Negro/plateado', 21771, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195907650-hervidor-thomas-th-4515n-2-litros-negroplateado-_JM', 'http://http2.mlstatic.com/D_887047-MLC93650605660_102025-I.jpg', 'MLC162504', '2025-10-03T21:31:28.130Z'::timestamptz, '2026-02-06T01:10:19.678Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195894838', 'WIPD36870', 'Freidora De Aire Th-af60mi Color Plateado Acero Inoxidable', 94990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195894838-freidora-de-aire-th-af60mi-color-plateado-acero-inoxidable-_JM', 'http://http2.mlstatic.com/D_803428-MLC94073909669_102025-I.jpg', 'MLC456045', '2025-10-03T21:59:13.308Z'::timestamptz, '2026-01-21T16:44:33.296Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195894462', 'WLJX34785', 'Alisador Siegen Sg-3540 Cerámica + Tourmalina', 37900, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195894462-alisador-siegen-sg-3540-ceramica-tourmalina-_JM', 'http://http2.mlstatic.com/D_668537-MLA99483690790_112025-I.jpg', 'MLC178457', '2025-10-03T21:18:14.157Z'::timestamptz, '2026-02-04T15:20:33.558Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195868516', 'MLNA36328', 'Secador De Pelo Siegen Sg-3035 Color Negro Negro/dorado', 19500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195868516-secador-de-pelo-siegen-sg-3035-color-negro-negrodorado-_JM', 'http://http2.mlstatic.com/D_744432-MLC94072041053_102025-I.jpg', 'MLC4597', '2025-10-03T21:22:45.793Z'::timestamptz, '2026-02-05T20:52:25.008Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195425012', 'DDKG01408', 'Panera Redonda De Mimbre 24 Cm Amarillo', 4990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195425012-panera-redonda-de-mimbre-24-cm-amarillo-_JM', 'http://http2.mlstatic.com/D_866193-MLA96433762574_102025-I.jpg', 'MLC413476', '2025-10-03T12:25:50.796Z'::timestamptz, '2026-01-21T16:44:22.355Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195946606', 'SGGT35202', 'Batidora Eléctrica Thomas Th-910pn Pedestal Negra', 88207, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195946606-batidora-electrica-thomas-th-910pn-pedestal-negra-_JM', 'http://http2.mlstatic.com/D_824075-MLA99944074689_112025-I.jpg', 'MLC440064', '2025-10-03T21:30:28.332Z'::timestamptz, '2026-02-05T00:22:26.314Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195868836', 'EWAP36219', 'Aspiradora Thomas Th-2206bl Ciclónica', 88207, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195868836-aspiradora-thomas-th-2206bl-ciclonica-_JM', 'http://http2.mlstatic.com/D_899947-MLA99450550594_112025-I.jpg', 'MLC4337', '2025-10-03T21:54:19.013Z'::timestamptz, '2026-01-21T16:44:26.519Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1711882097', 'WIPD36870', 'Freidora De Aire Th-af60mi Color Plateado', 94990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1711882097-freidora-de-aire-th-af60mi-color-plateado-_JM', 'http://http2.mlstatic.com/D_734953-MLA99522149662_122025-I.jpg', 'MLC456045', '2025-10-03T21:59:13.906Z'::timestamptz, '2026-01-21T16:34:08.686Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195933914', 'TXCY35680', 'Secador De Pelo Siegen Sg-3049c01 Color Fucsia', 26400, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195933914-secador-de-pelo-siegen-sg-3049c01-color-fucsia-_JM', 'http://http2.mlstatic.com/D_801343-MLA99933677395_112025-I.jpg', 'MLC4597', '2025-10-03T22:06:04.936Z'::timestamptz, '2026-02-04T23:19:01.183Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195894800', 'YQJG35992', 'Aspiradora Thomas Th-1407 1400w Color Gris', 47998, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3195894800-aspiradora-thomas-th-1407-1400w-color-gris-_JM', 'http://http2.mlstatic.com/D_672180-MLA99419577848_112025-I.jpg', 'MLC4337', '2025-10-03T21:53:05.313Z'::timestamptz, '2026-01-21T16:44:16.595Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3195933744', NULL, 'Parrilla Eléctrica Thomas Th-224 1650w Color Negro', 58900, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3195933744-parrilla-electrica-thomas-th-224-1650w-color-negro-_JM', 'http://http2.mlstatic.com/D_929599-MLC94073013393_102025-I.jpg', 'MLC174449', '2025-10-03T21:45:33.943Z'::timestamptz, '2026-01-21T16:44:29.130Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1716155885', 'BABA36843', 'Horno De Mesa Eléctrico Thomas 25litros Cocina Th-25n01', 57343, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1716155885-horno-de-mesa-electrico-thomas-25litros-cocina-th-25n01-_JM', 'http://http2.mlstatic.com/D_907430-MLA99870125487_112025-I.jpg', 'MLC30854', '2025-10-09T15:59:11.968Z'::timestamptz, '2026-01-21T16:44:28.326Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1712210619', 'MPGV90854', 'Panera Ovalada De Mimbre 27cm Dorado', 4990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1712210619-panera-ovalada-de-mimbre-27cm-dorado-_JM', 'http://http2.mlstatic.com/D_872063-MLA94013037583_102025-I.jpg', 'MLC413476', '2025-10-04T12:18:21.065Z'::timestamptz, '2026-01-21T16:34:19.005Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1720233209', 'GJCH00506', 'Bandeja Decorativa Navidad Viejo Pascuero Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1720233209-bandeja-decorativa-navidad-viejo-pascuero-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_884296-MLC96834097547_102025-I.jpg', 'MLC159287', '2025-10-13T19:58:06.681Z'::timestamptz, '2026-01-21T16:44:28.549Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215511730', 'EZGH00432', 'Plato De Navidad Decorativo De Ceramica Grande 31,5cm Rojo Viejo Pascuero', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215511730-plato-de-navidad-decorativo-de-ceramica-grande-315cm-rojo-viejo-pascuero-_JM', 'http://http2.mlstatic.com/D_812974-MLC94995901195_102025-I.jpg', 'MLC159292', '2025-10-14T00:32:00.649Z'::timestamptz, '2026-01-21T16:34:12.279Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3221949790', NULL, 'Tabla Para Picar De Madera Grande Gruesa 39x24,5x3,5 Pino Liso Pino', 7990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3221949790-tabla-para-picar-de-madera-grande-gruesa-39x245x35-pino-liso-pino-_JM', 'http://http2.mlstatic.com/D_874619-MLC95123647617_102025-I.jpg', 'MLC159275', '2025-10-14T19:24:12.306Z'::timestamptz, '2026-01-21T16:34:10.943Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1715903335', 'HUQH74041', 'Crema Aclarante Vanilla Passion 105 Ml Ritzy Mash Sin Tono', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1715903335-crema-aclarante-vanilla-passion-105-ml-ritzy-mash-sin-tono-_JM', 'http://http2.mlstatic.com/D_780660-MLA95743541952_102025-I.jpg', 'MLC174669', '2025-10-09T12:19:08.974Z'::timestamptz, '2026-01-21T16:44:19.284Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215037224', 'LVEU66924', 'Servilletero De Navidad Decorativo De Ceramica 11,5cm Rojo', 9980, 8, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215037224-servilletero-de-navidad-decorativo-de-ceramica-115cm-rojo-_JM', 'http://http2.mlstatic.com/D_912664-MLC101088250397_122025-I.jpg', 'MLC412712', '2025-10-14T00:25:56.812Z'::timestamptz, '2026-01-21T16:34:08.568Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215472364', 'BAMM00506', 'Bandeja Redonda De Navidad Decorativa De  Ceramica 31cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215472364-bandeja-redonda-de-navidad-decorativa-de-ceramica-31cm-rojo-_JM', 'http://http2.mlstatic.com/D_902927-MLC96384176070_102025-I.jpg', 'MLC159287', '2025-10-13T23:35:37.921Z'::timestamptz, '2026-01-21T16:49:08.105Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1720274527', 'PKTG00484', 'Bandeja Cuadrada De Navidad Decorativa De Ceramica 26cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1720274527-bandeja-cuadrada-de-navidad-decorativa-de-ceramica-26cm-rojo-_JM', 'http://http2.mlstatic.com/D_603780-MLC96834096023_102025-I.jpg', 'MLC159287', '2025-10-13T23:20:01.035Z'::timestamptz, '2026-01-21T16:48:44.927Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3214993650', 'ZTDG00360', 'Bandeja Rectangular Decorativa Navidad Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3214993650-bandeja-rectangular-decorativa-navidad-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_744535-MLC96383282334_102025-I.jpg', 'MLC159287', '2025-10-13T19:49:50.234Z'::timestamptz, '2026-01-21T16:44:34.979Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215036008', 'REAB00552', 'Bandeja Redonda De Navidad Decorativa De Ceramica 26cm Rojo', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215036008-bandeja-redonda-de-navidad-decorativa-de-ceramica-26cm-rojo-_JM', 'http://http2.mlstatic.com/D_931075-MLC94691824112_102025-I.jpg', 'MLC159287', '2025-10-13T23:42:29.486Z'::timestamptz, '2026-02-04T19:41:54.552Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215511822', 'DGBY00421', 'Bandeja Rectangular De Navidad Decorativa De Ceramica 33cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215511822-bandeja-rectangular-de-navidad-decorativa-de-ceramica-33cm-rojo-_JM', 'http://http2.mlstatic.com/D_603369-MLC94691703908_102025-I.jpg', 'MLC159287', '2025-10-14T00:36:04.826Z'::timestamptz, '2026-01-21T16:44:21.629Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1716836157', 'DXLS36165', 'Separador De Servicios Organizador De Servicios O Cubiertos Blanco', 4600, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1716836157-separador-de-servicios-organizador-de-servicios-o-cubiertos-blanco-_JM', 'http://http2.mlstatic.com/D_950315-MLC96430560724_102025-I.jpg', 'MLC436420', '2025-10-10T13:50:09.080Z'::timestamptz, '2026-02-05T20:18:24.664Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1715850997', 'JMEQ89364', 'Te Oolong Manzana Canela 150g Blends And Tea', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1715850997-te-oolong-manzana-canela-150g-blends-and-tea-_JM', 'http://http2.mlstatic.com/D_854783-MLC94128468284_102025-I.jpg', 'MLC178668', '2025-10-09T16:11:08.589Z'::timestamptz, '2026-01-21T16:44:23.323Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1715889737', 'BABA36843', 'Horno De Mesa Eléctrico Thomas 25litros Cocina Th-25n01', 57343, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1715889737-horno-de-mesa-electrico-thomas-25litros-cocina-th-25n01-_JM', 'http://http2.mlstatic.com/D_761283-MLC94127401316_102025-I.jpg', 'MLC30854', '2025-10-09T15:59:11.282Z'::timestamptz, '2026-01-21T16:34:09.578Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215073938', 'AJSS00466', 'Bandeja Redonda Navideña Viejo Pascuero De Ceramica 33cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215073938-bandeja-redonda-navidena-viejo-pascuero-de-ceramica-33cm-rojo-_JM', 'http://http2.mlstatic.com/D_672704-MLC96384176154_102025-I.jpg', 'MLC159287', '2025-10-13T23:13:09.404Z'::timestamptz, '2026-01-21T16:44:33.101Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3213493958', 'ONOT65117', 'Kuna Foods Cereales Puffs Manzana Arándano Sin Tacc Sin Azúcar 50g', 3128, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3213493958-kuna-foods-cereales-puffs-manzana-arandano-sin-tacc-sin-azucar-50g-_JM', 'http://http2.mlstatic.com/D_651677-MLA99829055957_112025-I.jpg', 'MLC418437', '2025-10-13T12:09:01.239Z'::timestamptz, '2026-02-05T23:58:40.905Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215473556', 'WMPT68039', 'Bandeja Rectangular De Navidad Decorativa De Ceramica 32,5cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215473556-bandeja-rectangular-de-navidad-decorativa-de-ceramica-325cm-rojo-_JM', 'http://http2.mlstatic.com/D_925773-MLC96833689011_102025-I.jpg', 'MLC159287', '2025-10-14T00:19:13.274Z'::timestamptz, '2026-01-21T16:44:30.366Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3215474142', 'XOQW00534', 'Tetera De Navidad Decorativa De Ceramica 700ml Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3215474142-tetera-de-navidad-decorativa-de-ceramica-700ml-rojo-_JM', 'http://http2.mlstatic.com/D_691310-MLC94691409732_102025-I.jpg', 'MLC440228', '2025-10-14T00:40:33.089Z'::timestamptz, '2026-01-21T16:44:22.117Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3210459358', 'BABA64125', 'Bandeja De Desayuno Madera Plegable Portavasos Cama Notebook Marrón', 15990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3210459358-bandeja-de-desayuno-madera-plegable-portavasos-cama-notebook-marron-_JM', 'http://http2.mlstatic.com/D_746493-MLC94351452334_102025-I.jpg', 'MLC159287', '2025-10-11T16:48:50.205Z'::timestamptz, '2026-01-26T09:04:59.499Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2997779812', 'FYXE85419', 'Auriculares Gamer Inalámbricos Hoco Bluetooth W35 Max Negro', 15890, 21, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2997779812-auriculares-gamer-inalambricos-hoco-bluetooth-w35-max-negro-_JM', 'http://http2.mlstatic.com/D_940743-MLA99850420245_112025-I.jpg', 'MLC441017', '2025-07-29T15:07:48.135Z'::timestamptz, '2026-02-04T01:38:53.004Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3221654658', 'VDRC07938', 'Suplemento En Polvo Strive Suplementos Creatina Monohidratada De Crapure Creatina Monohidratada X 5g', 32243, 54, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3221654658-suplemento-en-polvo-strive-suplementos-creatina-monohidratada-de-crapure-creatina-monohidratada-x-5g-_JM', 'http://http2.mlstatic.com/D_899926-MLA99463651412_112025-I.jpg', 'MLC435304', '2025-10-14T22:00:26.291Z'::timestamptz, '2026-02-05T16:57:14.893Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288513340', 'VIST00547', 'Hoco Audifono Tws Con Cancelacion Ruido+enc Comp iPhone Eq16 Morado', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288513340-hoco-audifono-tws-con-cancelacion-ruidoenc-comp-iphone-eq16-morado-_JM', 'http://http2.mlstatic.com/D_712867-MLC96318572550_102025-I.jpg', 'MLC3697', '2025-10-30T21:44:22.277Z'::timestamptz, '2026-01-21T16:44:26.526Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288558284', 'JHES68025', 'Conjunto De Tazas Con Plato Navideño 6 Pzas 600ml Rojo Viejito Pascuero', 9980, 1, 'active', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3288558284-conjunto-de-tazas-con-plato-navideno-6-pzas-600ml-rojo-viejito-pascuero-_JM', 'http://http2.mlstatic.com/D_925902-MLC96324338574_102025-I.jpg', 'MLC159290', '2025-10-30T15:54:19.529Z'::timestamptz, '2026-01-21T16:44:31.346Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3289741356', 'TBWT00523', 'Soporte De Coche Para Smartphone Tipo Garra Con Ventosa', 6590, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3289741356-soporte-de-coche-para-smartphone-tipo-garra-con-ventosa-_JM', 'http://http2.mlstatic.com/D_666928-MLC96318917280_102025-I.jpg', 'MLC58500', '2025-10-30T21:40:21.620Z'::timestamptz, '2026-01-21T16:44:25.052Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288539538', 'QZCO00450', 'Audífonos Deportivos Conducción Ósea Aérea Bluetooth Hoco 8h Negro', 16500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288539538-audifonos-deportivos-conduccion-osea-aerea-bluetooth-hoco-8h-negro-_JM', 'http://http2.mlstatic.com/D_735163-MLA100584126112_122025-I.jpg', 'MLC3697', '2025-10-30T21:49:08.808Z'::timestamptz, '2026-01-21T16:34:12.736Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3284380788', 'JYQY00318', 'Lechero Navideño Lechero De Navidad Ceramica 1 Litro Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3284380788-lechero-navideno-lechero-de-navidad-ceramica-1-litro-rojo-_JM', 'http://http2.mlstatic.com/D_700864-MLC96335868270_102025-I.jpg', 'MLC413645', '2025-10-30T03:01:51.696Z'::timestamptz, '2026-01-21T16:34:10.008Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3284432666', 'JOZI66673', 'Frasco De Almacenaje Navideño Ceramica 3,5 L Decorativo Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3284432666-frasco-de-almacenaje-navideno-ceramica-35-l-decorativo-rojo-_JM', 'http://http2.mlstatic.com/D_654504-MLC96323478706_102025-I.jpg', 'MLC179058', '2025-10-30T02:55:12.887Z'::timestamptz, '2026-01-21T16:34:10.816Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288552316', 'ZSPW00445', 'Powerbank Carga Rapida 22.5w Hoco J142 100.000mah Linterna Negro', 77370, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288552316-powerbank-carga-rapida-225w-hoco-j142-100000mah-linterna-negro-_JM', 'http://http2.mlstatic.com/D_955956-MLA99488775858_112025-I.jpg', 'MLC157684', '2025-10-30T21:39:05.750Z'::timestamptz, '2026-01-21T16:34:12.048Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1726540139', 'TNSC35241', 'Goldenmilk Matcha 240 Gr - Leche Dorada Alma Foods', 20990, 17, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1726540139-goldenmilk-matcha-240-gr-leche-dorada-alma-foods-_JM', 'http://http2.mlstatic.com/D_754831-MLA99334394758_112025-I.jpg', 'MLC178668', '2025-10-19T21:12:07.020Z'::timestamptz, '2026-02-02T18:19:40.090Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288534824', 'OXYB00523', 'Audifonos Hoco Ew45 In Ear Bluetooth Tws Forest Cat  Verde Verde Oscuro', 9980, 25, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288534824-audifonos-hoco-ew45-in-ear-bluetooth-tws-forest-cat-verde-verde-oscuro-_JM', 'http://http2.mlstatic.com/D_892925-MLC96751940139_102025-I.jpg', 'MLC3697', '2025-10-30T17:47:57.663Z'::timestamptz, '2026-02-05T16:37:56.287Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288521680', 'YXCR02275', 'Audifono Inalambrico In-ear Hoco Ew77 Blanco - Blanco', 10500, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288521680-audifono-inalambrico-in-ear-hoco-ew77-blanco-blanco-_JM', 'http://http2.mlstatic.com/D_799982-MLC96752600435_102025-I.jpg', 'MLC440984', '2025-10-30T17:54:27.118Z'::timestamptz, '2026-02-06T00:15:15.304Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288513352', 'HPDP00497', 'Audifonos Hoco Eq16 Cancelacion Ruido+enc Color Azul Acero Azul Acero', 16990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288513352-audifonos-hoco-eq16-cancelacion-ruidoenc-color-azul-acero-azul-acero-_JM', 'http://http2.mlstatic.com/D_605845-MLC96318574240_102025-I.jpg', 'MLC3697', '2025-10-30T21:48:14.435Z'::timestamptz, '2026-01-31T04:48:56.754Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288564952', 'NNHJ00510', 'Cargador Portatil Hoco J100 10000mah Powerbank Negro', 10790, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288564952-cargador-portatil-hoco-j100-10000mah-powerbank-negro-_JM', 'http://http2.mlstatic.com/D_998223-MLA100007431523_122025-I.jpg', 'MLC157684', '2025-10-30T21:36:37.419Z'::timestamptz, '2026-01-21T16:44:20.489Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288521682', 'YXCR02275', 'Audifono Inalambrico In-ear Hoco Ew77 Blanco', 10500, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288521682-audifono-inalambrico-in-ear-hoco-ew77-blanco-_JM', 'http://http2.mlstatic.com/D_839989-MLA96178561537_102025-I.jpg', 'MLC440984', '2025-10-30T17:54:27.660Z'::timestamptz, '2026-02-06T00:15:15.350Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2997519898', 'FYXE85419', 'Audifonos Bluetooth Marca Hoco Modelo W35 Max Over Ear Negro Negro', 15890, 21, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2997519898-audifonos-bluetooth-marca-hoco-modelo-w35-max-over-ear-negro-negro-_JM', 'http://http2.mlstatic.com/D_953498-MLA84182956120_052025-I.jpg', 'MLC441017', '2025-07-29T15:07:47.613Z'::timestamptz, '2026-02-04T01:38:53.003Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669104065', 'QADS92067', 'Secador De Pelo Siegen Sg-3031 Color Púrpura Púrpura', 16290, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669104065-secador-de-pelo-siegen-sg-3031-color-purpura-purpura-_JM', 'http://http2.mlstatic.com/D_709179-MLC89455867116_082025-I.jpg', 'MLC4597', '2025-08-10T19:37:17.052Z'::timestamptz, '2026-02-06T01:13:11.074Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1669000313', 'QADS92067', 'Secador De Pelo Siegen Sg-3031 Color Púrpura', 16290, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1669000313-secador-de-pelo-siegen-sg-3031-color-purpura-_JM', 'http://http2.mlstatic.com/D_713726-MLA95674811268_102025-I.jpg', 'MLC4597', '2025-08-10T19:37:17.605Z'::timestamptz, '2026-02-06T01:13:11.078Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288521626', 'FTTC67510', 'Soporte De Celular Para Moto Hoco H31 Wild Wolf Negro - Negro', 8338, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288521626-soporte-de-celular-para-moto-hoco-h31-wild-wolf-negro-negro-_JM', 'http://http2.mlstatic.com/D_997814-MLC96302563126_102025-I.jpg', 'MLC58500', '2025-10-30T17:48:54.104Z'::timestamptz, '2026-01-21T16:44:26.297Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288521702', 'CIRW68672', 'Audifonos Hoco Eq5 Energy Anc Tws In Ear Bluetooth Negro - Negro', 16654, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288521702-audifonos-hoco-eq5-energy-anc-tws-in-ear-bluetooth-negro-negro-_JM', 'http://http2.mlstatic.com/D_830900-MLC96753178539_102025-I.jpg', 'MLC3697', '2025-10-30T17:56:27.843Z'::timestamptz, '2026-01-21T16:44:26.227Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288508736', 'MRRX00497', 'Audifonos Inalambricos Para Niños Gato Bluetooth Hoco Ew46 Gris', 13190, 30, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288508736-audifonos-inalambricos-para-ninos-gato-bluetooth-hoco-ew46-gris-_JM', 'http://http2.mlstatic.com/D_724025-MLC96302551348_102025-I.jpg', 'MLC3697', '2025-10-30T17:45:10.081Z'::timestamptz, '2026-01-21T16:34:08.668Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288409828', 'FIEE00510', 'Powerbank De 80000mah 65w Con Linterna Pantalla Digital Fast Negro', 79537, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288409828-powerbank-de-80000mah-65w-con-linterna-pantalla-digital-fast-negro-_JM', 'http://http2.mlstatic.com/D_858490-MLA99405646150_112025-I.jpg', 'MLC157684', '2025-10-30T21:38:01.977Z'::timestamptz, '2026-01-21T16:44:27.502Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288070092', 'HIEY00497', 'Dispositivo Inteligente Anti Pérdida Smart Tag Hoco E91 Color Negro Compatible Con iPhone Blanco', 10400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288070092-dispositivo-inteligente-anti-perdida-smart-tag-hoco-e91-color-negro-compatible-con-iphone-blanco-_JM', 'http://http2.mlstatic.com/D_821811-MLA99509860190_112025-I.jpg', 'MLC416947', '2025-10-30T17:42:09.769Z'::timestamptz, '2026-01-21T16:44:28.769Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288070180', 'TZNQ68382', 'Hoco®j115 Mini Batería Portátil 5000mah Para iPhone/ Android Color Negro', 7900, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288070180-hocoj115-mini-bateria-portatil-5000mah-para-iphone-android-color-negro-_JM', 'http://http2.mlstatic.com/D_991790-MLA92048711987_092025-I.jpg', 'MLC157684', '2025-10-30T17:55:32.365Z'::timestamptz, '2026-01-21T16:44:32.278Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288388902', 'FZBZ00339', 'Tazon De Navidad 800 Ml De Ceramica Merry Christmas Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288388902-tazon-de-navidad-800-ml-de-ceramica-merry-christmas-rojo-_JM', 'http://http2.mlstatic.com/D_722081-MLC96775587313_102025-I.jpg', 'MLC32658', '2025-10-30T15:02:05.627Z'::timestamptz, '2026-01-21T16:44:19.063Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288480604', 'GZMI00484', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica 20c Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288480604-caramelera-navidena-galletero-navideno-pascuero-ceramica-20c-rojo-_JM', 'http://http2.mlstatic.com/D_766595-MLC96324528994_102025-I.jpg', 'MLC413490', '2025-10-30T15:46:19.657Z'::timestamptz, '2026-01-21T16:44:23.795Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288422610', 'TNHL68094', 'Soporte Para Auto Hoco Ca76 Para Tablero Porta Celular Negro', 5942, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288422610-soporte-para-auto-hoco-ca76-para-tablero-porta-celular-negro-_JM', 'http://http2.mlstatic.com/D_992872-MLA99707739074_122025-I.jpg', 'MLC58500', '2025-10-30T21:41:18.742Z'::timestamptz, '2026-01-21T16:44:28.324Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288402500', 'OCBC68162', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica 27c Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288402500-caramelera-navidena-galletero-navideno-pascuero-ceramica-27c-rojo-_JM', 'http://http2.mlstatic.com/D_727488-MLC96774870867_102025-I.jpg', 'MLC413490', '2025-10-30T15:28:07.051Z'::timestamptz, '2026-01-21T16:44:22.323Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288074778', 'QZCO00450', 'Audífonos Deportivos Conducción Ósea Aérea Bluetooth Hoco 8h Negro', 16500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288074778-audifonos-deportivos-conduccion-osea-aerea-bluetooth-hoco-8h-negro-_JM', 'http://http2.mlstatic.com/D_609861-MLC96318891724_102025-I.jpg', 'MLC3697', '2025-10-30T21:49:08.201Z'::timestamptz, '2026-01-21T16:44:20.539Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288435656', 'FIEE00510', 'Powerbank De 80000mah 65w Con Linterna Pantalla Digital Fast Negro', 79537, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288435656-powerbank-de-80000mah-65w-con-linterna-pantalla-digital-fast-negro-_JM', 'http://http2.mlstatic.com/D_833011-MLC96318866816_102025-I.jpg', 'MLC157684', '2025-10-30T21:38:01.417Z'::timestamptz, '2026-01-21T16:44:33.816Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288397062', 'ZSPW00445', 'Powerbank Carga Rapida 22.5w Hoco J142 100.000mah Linterna Negro', 77370, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288397062-powerbank-carga-rapida-225w-hoco-j142-100000mah-linterna-negro-_JM', 'http://http2.mlstatic.com/D_880979-MLC96318659026_102025-I.jpg', 'MLC157684', '2025-10-30T21:39:05.211Z'::timestamptz, '2026-01-21T16:34:16.280Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288409870', 'VIST00547', 'Hoco Audifono Tws Con Cancelacion Ruido+enc Comp iPhone Eq16 Color Morado', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288409870-hoco-audifono-tws-con-cancelacion-ruidoenc-comp-iphone-eq16-color-morado-_JM', 'http://http2.mlstatic.com/D_649365-MLA99476066092_112025-I.jpg', 'MLC3697', '2025-10-30T21:44:22.811Z'::timestamptz, '2026-01-21T16:44:22.480Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288070166', 'PKJS00413', 'Soporte Porta Celular 360° De Rejilla Ventilacion Auto Coche', 4200, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288070166-soporte-porta-celular-360-de-rejilla-ventilacion-auto-coche-_JM', 'http://http2.mlstatic.com/D_861367-MLC96751892331_102025-I.jpg', 'MLC58500', '2025-10-30T17:52:40.766Z'::timestamptz, '2026-02-05T16:02:45.333Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288397022', 'NNHJ00510', 'Cargador Portatil Hoco J100 10000mah Powerbank Negro Negro', 10790, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288397022-cargador-portatil-hoco-j100-10000mah-powerbank-negro-negro-_JM', 'http://http2.mlstatic.com/D_914218-MLC96318974890_102025-I.jpg', 'MLC157684', '2025-10-30T21:36:36.893Z'::timestamptz, '2026-01-21T16:44:25.998Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288483108', 'QGWO00445', 'Audifonos Hoco Ew46 Tws In Ear Bluetooth Khaki Cat Color Amarillo', 11490, 30, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288483108-audifonos-hoco-ew46-tws-in-ear-bluetooth-khaki-cat-color-amarillo-_JM', 'http://http2.mlstatic.com/D_896906-MLA99955343963_112025-I.jpg', 'MLC3697', '2025-10-30T17:46:54.715Z'::timestamptz, '2026-01-21T16:34:12.734Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288405278', 'OXYB00523', 'Audifonos Hoco Ew45 In Ear Bluetooth Tws Forest Cat Color Verde', 9980, 25, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288405278-audifonos-hoco-ew45-in-ear-bluetooth-tws-forest-cat-color-verde-_JM', 'http://http2.mlstatic.com/D_818097-MLA99517859846_112025-I.jpg', 'MLC3697', '2025-10-30T17:47:58.309Z'::timestamptz, '2026-02-05T16:37:56.284Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288441608', 'ULCE00552', 'Bandeja Rectangular Navideña 28cm Ceramica Decorativa - Rojo', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288441608-bandeja-rectangular-navidena-28cm-ceramica-decorativa-rojo-_JM', 'http://http2.mlstatic.com/D_858315-MLC96774357739_102025-I.jpg', 'MLC159287', '2025-10-30T15:39:07.176Z'::timestamptz, '2026-01-21T16:44:23.345Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288392442', 'CIRW68672', 'Audifonos Hoco Eq5 Energy Anc Tws In Ear Bluetooth Negro', 16654, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288392442-audifonos-hoco-eq5-energy-anc-tws-in-ear-bluetooth-negro-_JM', 'http://http2.mlstatic.com/D_958394-MLA99458045816_112025-I.jpg', 'MLC3697', '2025-10-30T17:56:28.458Z'::timestamptz, '2026-01-21T16:44:20.535Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288431120', 'TZNQ68382', 'Hoco®j115 Mini Batería Portátil 5000mah Para iPhone/ Android Negro', 7900, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288431120-hocoj115-mini-bateria-portatil-5000mah-para-iphone-android-negro-_JM', 'http://http2.mlstatic.com/D_934727-MLC96751893707_102025-I.jpg', 'MLC157684', '2025-10-30T17:55:31.762Z'::timestamptz, '2026-01-21T16:34:10.342Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288422644', 'DTCY00466', 'Audifonos Hoco Es64 Easy Sound Sports In Ear Bluetooth Negro', 9152, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288422644-audifonos-hoco-es64-easy-sound-sports-in-ear-bluetooth-negro-_JM', 'http://http2.mlstatic.com/D_851895-MLA99358194410_112025-I.jpg', 'MLC3697', '2025-10-30T21:46:11.418Z'::timestamptz, '2026-01-21T16:44:27.740Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3309044210', 'VCEL06784', 'Cepillo Turbo Ion 2600 3 En 1 Gama Rojo', 64990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3309044210-cepillo-turbo-ion-2600-3-en-1-gama-rojo-_JM', 'http://http2.mlstatic.com/D_897252-MLA99857112315_112025-I.jpg', 'MLC4597', '2025-11-06T00:41:43.587Z'::timestamptz, '2026-01-21T16:44:21.829Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288067140', 'VHFT00413', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica 18c Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288067140-caramelera-navidena-galletero-navideno-pascuero-ceramica-18c-rojo-_JM', 'http://http2.mlstatic.com/D_885175-MLC96774410573_102025-I.jpg', 'MLC413490', '2025-10-30T15:19:26.007Z'::timestamptz, '2026-01-21T16:44:31.171Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3287014280', 'YIDU00497', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3287014280-caramelera-navidena-galletero-navideno-pascuero-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_797923-MLC96784571257_102025-I.jpg', 'MLC413490', '2025-10-30T13:39:49.641Z'::timestamptz, '2026-01-21T16:44:31.075Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738648619', 'HPDP00497', 'Audifonos Hoco Eq16 Cancelacion Ruido+enc Color Azul Acero', 16990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738648619-audifonos-hoco-eq16-cancelacion-ruidoenc-color-azul-acero-_JM', 'http://http2.mlstatic.com/D_952095-MLA99506795680_112025-I.jpg', 'MLC3697', '2025-10-30T21:48:14.949Z'::timestamptz, '2026-01-31T04:48:56.756Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738648611', 'DTCY00466', 'Audifonos Hoco Es64 Easy Sound Sports In Ear Bluetooth Negro Negro', 9152, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738648611-audifonos-hoco-es64-easy-sound-sports-in-ear-bluetooth-negro-negro-_JM', 'http://http2.mlstatic.com/D_861908-MLC96318602824_102025-I.jpg', 'MLC3697', '2025-10-30T21:46:10.748Z'::timestamptz, '2026-01-21T16:44:22.224Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3309264764', 'OSIH07131', 'Gama Alisador Elegance Keration Std Negro Rosa', 33678, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3309264764-gama-alisador-elegance-keration-std-negro-rosa-_JM', 'http://http2.mlstatic.com/D_745024-MLC97359483185_112025-I.jpg', 'MLC178457', '2025-11-06T00:38:23.591Z'::timestamptz, '2026-01-21T16:44:27.527Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3287016472', 'BMZY67677', 'Bola De Nieve Bola De Cristal Navideño Con Luces Led 15cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3287016472-bola-de-nieve-bola-de-cristal-navideno-con-luces-led-15cm-rojo-_JM', 'http://http2.mlstatic.com/D_925193-MLC96326569660_102025-I.jpg', 'MLC7175', '2025-10-30T14:25:03.215Z'::timestamptz, '2026-01-21T16:44:27.552Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3309264862', 'PKJS22658', 'Plancha De Cabello Mini Ga.ma Italy Cp1 Mini Ceramic Ion Negro', 17990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3309264862-plancha-de-cabello-mini-gama-italy-cp1-mini-ceramic-ion-negro-_JM', 'http://http2.mlstatic.com/D_980001-MLC97359881203_112025-I.jpg', 'MLC178457', '2025-11-06T00:44:53.996Z'::timestamptz, '2026-01-21T16:44:20.086Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3295825624', 'DNOP00478', 'Bandeja Rectangular De Navidad Decorativa De Ceramica 32cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3295825624-bandeja-rectangular-de-navidad-decorativa-de-ceramica-32cm-rojo-_JM', 'http://http2.mlstatic.com/D_772512-MLC96428876258_102025-I.jpg', 'MLC159287', '2025-11-01T01:42:00.987Z'::timestamptz, '2026-01-21T16:44:21.782Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3287021876', 'MRRX00497', 'Audifonos Inalambricos Para Niños Gato Bluetooth Hoco Ew46 Color Gris', 13190, 30, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3287021876-audifonos-inalambricos-para-ninos-gato-bluetooth-hoco-ew46-color-gris-_JM', 'http://http2.mlstatic.com/D_819080-MLA100868648447_122025-I.jpg', 'MLC3697', '2025-10-30T17:45:10.650Z'::timestamptz, '2026-01-21T16:44:19.517Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738017115', 'WYLD00432', 'Jarra Navideña Jarra Decorativa De Navidad 2l Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738017115-jarra-navidena-jarra-decorativa-de-navidad-2l-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_909703-MLC96784562251_102025-I.jpg', 'MLC179055', '2025-10-30T13:22:51.951Z'::timestamptz, '2026-01-21T16:34:11.865Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1737926667', 'DKXK00445', 'Estatua Dama De La Justicia Adorno Dama De La Justicia 35cm - Dorado Oscuro', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1737926667-estatua-dama-de-la-justicia-adorno-dama-de-la-justicia-35cm-dorado-oscuro-_JM', 'http://http2.mlstatic.com/D_983680-MLC96784610193_102025-I.jpg', 'MLC412687', '2025-10-30T13:51:55.817Z'::timestamptz, '2026-01-21T16:44:20.267Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738648587', 'TNHL68094', 'Soporte Para Auto Hoco Ca76 Para Tablero Porta Celular Negro', 5942, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738648587-soporte-para-auto-hoco-ca76-para-tablero-porta-celular-negro-_JM', 'http://http2.mlstatic.com/D_619108-MLC96318600574_102025-I.jpg', 'MLC58500', '2025-10-30T21:41:18.156Z'::timestamptz, '2026-01-21T16:44:31.409Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738018941', 'OHFT00373', 'Bola De Nieve Bola De Cristal Navideño Con Luces Led 14cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738018941-bola-de-nieve-bola-de-cristal-navideno-con-luces-led-14cm-rojo-_JM', 'http://http2.mlstatic.com/D_622181-MLC96334697376_102025-I.jpg', 'MLC7175', '2025-10-30T14:14:12.234Z'::timestamptz, '2026-01-21T16:44:23.656Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738058847', 'LVYM00318', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica 21c Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738058847-caramelera-navidena-galletero-navideno-pascuero-ceramica-21c-rojo-_JM', 'http://http2.mlstatic.com/D_778465-MLC96326586476_102025-I.jpg', 'MLC413490', '2025-10-30T14:41:58.847Z'::timestamptz, '2026-01-21T16:44:23.546Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738316623', 'QGWO00445', 'Audifonos Hoco Ew46 Tws In Ear Bluetooth Khaki Cat Amarillo Marrón', 11490, 30, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738316623-audifonos-hoco-ew46-tws-in-ear-bluetooth-khaki-cat-amarillo-marron-_JM', 'http://http2.mlstatic.com/D_644954-MLC96751860039_102025-I.jpg', 'MLC3697', '2025-10-30T17:46:54.095Z'::timestamptz, '2026-01-21T16:44:20.169Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3288070090', 'HIEY00497', 'Dispositivo Inteligente Anti Pérdida Smart Tag Hoco iPhone - Blanco', 10400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3288070090-dispositivo-inteligente-anti-perdida-smart-tag-hoco-iphone-blanco-_JM', 'http://http2.mlstatic.com/D_702160-MLC96303096554_102025-I.jpg', 'MLC416947', '2025-10-30T17:42:09.112Z'::timestamptz, '2026-01-21T16:44:23.213Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3309264864', 'PKJS22658', 'Plancha De Cabello Mini Ga.ma Italy Cp1 Mini Ceramic Ion Negra', 17990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3309264864-plancha-de-cabello-mini-gama-italy-cp1-mini-ceramic-ion-negra-_JM', 'http://http2.mlstatic.com/D_959449-MLA99897455603_112025-I.jpg', 'MLC178457', '2025-11-06T00:44:54.595Z'::timestamptz, '2026-01-21T16:44:26.023Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3309264656', 'TONP07521', 'Balanza Digital Gama Negra Scg 430 Vidrio Templado Black Negro', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3309264656-balanza-digital-gama-negra-scg-430-vidrio-templado-black-negro-_JM', 'http://http2.mlstatic.com/D_833580-MLC97359372581_112025-I.jpg', 'MLC174421', '2025-11-06T00:30:22.931Z'::timestamptz, '2026-01-21T16:34:13.133Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1738316643', 'FTTC67510', 'Soporte De Celular Para Moto Hoco H31 Wild Wolf Negro', 8338, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1738316643-soporte-de-celular-para-moto-hoco-h31-wild-wolf-negro-_JM', 'http://http2.mlstatic.com/D_917195-MLA99884706629_112025-I.jpg', 'MLC58500', '2025-10-30T17:48:54.694Z'::timestamptz, '2026-01-21T16:34:23.053Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314363014', 'REAB00552', 'Bandeja Redonda Navideña Cerámica 26cm Viejito Pascuero Relieve Rojo', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314363014-bandeja-redonda-navidena-ceramica-26cm-viejito-pascuero-relieve-rojo-_JM', 'http://http2.mlstatic.com/D_954460-MLA97448979299_112025-I.jpg', 'MLC159287', '2025-11-06T16:40:07.445Z'::timestamptz, '2026-02-04T19:41:54.562Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744497809', NULL, 'Plancha Alisadora Gama Alais Ceramic Shine Ion Nano Silver Negro', 19988, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1744497809-plancha-alisadora-gama-alais-ceramic-shine-ion-nano-silver-negro-_JM', 'http://http2.mlstatic.com/D_649790-MLA84839571217_052025-I.jpg', 'MLC178457', '2025-11-06T00:43:42.641Z'::timestamptz, '2026-01-22T23:20:56.380Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744325747', 'ZJAL07177', 'Olla Cera Depilatoria Gama Dep 500 Cc Blanca Blanco', 17990, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1744325747-olla-cera-depilatoria-gama-dep-500-cc-blanca-blanco-_JM', 'http://http2.mlstatic.com/D_669805-MLA96990874484_112025-I.jpg', 'MLC178736', '2025-11-06T00:35:37.691Z'::timestamptz, '2026-02-05T11:21:25.929Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314908462', 'LVYM00318', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica 21c - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314908462-caramelera-navidena-galletero-navideno-pascuero-ceramica-21c-rojo-_JM', 'http://http2.mlstatic.com/D_739567-MLA96995981404_112025-I.jpg', 'MLC413490', '2025-11-06T17:38:31.700Z'::timestamptz, '2026-01-21T16:44:31.185Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744510723', 'VCEL06784', 'Cepillo Turbo Ion 2600 3 En 1 Gama Rojo', 64990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1744510723-cepillo-turbo-ion-2600-3-en-1-gama-rojo-_JM', 'http://http2.mlstatic.com/D_792065-MLC96903180108_112025-I.jpg', 'MLC4597', '2025-11-06T00:41:43.047Z'::timestamptz, '2026-01-21T16:34:11.519Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314324000', 'DKXK00445', 'Estatua Dama De La Justicia Adorno Dama De La Justicia 35cm - Dorado Oscuro', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314324000-estatua-dama-de-la-justicia-adorno-dama-de-la-justicia-35cm-dorado-oscuro-_JM', 'http://http2.mlstatic.com/D_687574-MLA97448611381_112025-I.jpg', 'MLC412687', '2025-11-06T16:21:51.894Z'::timestamptz, '2026-01-21T16:34:09.140Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314687064', 'GZMI00484', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica 20c - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314687064-caramelera-navidena-galletero-navideno-pascuero-ceramica-20c-rojo-_JM', 'http://http2.mlstatic.com/D_705767-MLA96994570008_112025-I.jpg', 'MLC413490', '2025-11-06T17:14:16.122Z'::timestamptz, '2026-01-21T16:44:27.271Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314791410', 'FZBZ00339', 'Tazon De Navidad 800 Ml De Ceramica Merry Christmas - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314791410-tazon-de-navidad-800-ml-de-ceramica-merry-christmas-rojo-_JM', 'http://http2.mlstatic.com/D_788191-MLA96994571860_112025-I.jpg', 'MLC32658', '2025-11-06T17:17:01.503Z'::timestamptz, '2026-01-21T16:34:08.782Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314311740', 'FUNL64028', 'Caja Panera De Madera Con Tapa Enrollable Multiuso Grande - Madera - Pino', 14990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314311740-caja-panera-de-madera-con-tapa-enrollable-multiuso-grande-madera-pino-_JM', 'http://http2.mlstatic.com/D_939036-MLA96991453694_112025-I.jpg', 'MLC436311', '2025-11-06T16:25:21.200Z'::timestamptz, '2026-01-21T16:44:34.544Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744587827', 'KNLM02585', 'Puffs Cereal Infantil Kuna Foods Sabor Cacao - 50g Sin Tacc Sin Sellos', 3386, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1744587827-puffs-cereal-infantil-kuna-foods-sabor-cacao-50g-sin-tacc-sin-sellos-_JM', 'http://http2.mlstatic.com/D_674123-MLA99851586187_112025-I.jpg', 'MLC411996', '2025-11-06T02:13:14.336Z'::timestamptz, '2026-02-04T18:14:33.040Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314986278', 'GJCH00506', 'Bandeja Decorativa Navidad Viejo Pascuero Ceramica - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314986278-bandeja-decorativa-navidad-viejo-pascuero-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_910855-MLA97452734667_112025-I.jpg', 'MLC159287', '2025-11-06T17:32:12.317Z'::timestamptz, '2026-01-21T16:44:29.042Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744547589', NULL, 'Cortapelo Clipper Multistyler Gama Gc 625 Inalámbrico Color Gris', 35346, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1744547589-cortapelo-clipper-multistyler-gama-gc-625-inalambrico-color-gris-_JM', 'http://http2.mlstatic.com/D_970417-MLA99497170618_112025-I.jpg', 'MLC5411', '2025-11-06T00:39:09.606Z'::timestamptz, '2026-01-21T16:44:19.523Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744573041', 'TONP07521', 'Balanza Digital Gama Negra Scg 430 Vidrio Templado Black Color Negro', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1744573041-balanza-digital-gama-negra-scg-430-vidrio-templado-black-color-negro-_JM', 'http://http2.mlstatic.com/D_673379-MLA84847778003_052025-I.jpg', 'MLC174421', '2025-11-06T00:30:23.576Z'::timestamptz, '2026-01-21T16:44:20.104Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3309044160', NULL, 'Cortapelo Clipper Multistyler Gama Gc 625 Inalámbrico Gris Negro', 35346, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3309044160-cortapelo-clipper-multistyler-gama-gc-625-inalambrico-gris-negro-_JM', 'http://http2.mlstatic.com/D_613576-MLC96903069888_112025-I.jpg', 'MLC5411', '2025-11-06T00:39:09.063Z'::timestamptz, '2026-01-21T16:34:10.343Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744512881', 'KNLM02585', 'Puffs Cereal Infantil Kuna Foods Sabor Cacao - 50g', 3386, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1744512881-puffs-cereal-infantil-kuna-foods-sabor-cacao-50g-_JM', 'http://http2.mlstatic.com/D_973315-MLC96907587954_112025-I.jpg', 'MLC411996', '2025-11-06T02:13:13.719Z'::timestamptz, '2026-02-04T18:14:30.072Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314375806', 'PKTG00484', 'Bandeja Cuadrada De Navidad Decorativa De Ceramica 26cm - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314375806-bandeja-cuadrada-de-navidad-decorativa-de-ceramica-26cm-rojo-_JM', 'http://http2.mlstatic.com/D_899689-MLA96992024436_112025-I.jpg', 'MLC159287', '2025-11-06T16:45:43.042Z'::timestamptz, '2026-01-26T14:20:56.429Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744560251', 'OSIH07131', 'Gama Alisador Elegance Keration Std Negro', 33678, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1744560251-gama-alisador-elegance-keration-std-negro-_JM', 'http://http2.mlstatic.com/D_751453-MLA99937574883_112025-I.jpg', 'MLC178457', '2025-11-06T00:38:24.052Z'::timestamptz, '2026-01-21T16:44:29.298Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314388344', 'XOQW00534', 'Tetera De Navidad Decorativa De Ceramica 700ml - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314388344-tetera-de-navidad-decorativa-de-ceramica-700ml-rojo-_JM', 'http://http2.mlstatic.com/D_775772-MLA96992412030_112025-I.jpg', 'MLC440228', '2025-11-06T16:35:15.618Z'::timestamptz, '2026-01-21T16:44:22.347Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1744497811', NULL, 'Plancha Alisadora Gama Alais Ceramic Shine Ion Nano Silver Color Negro', 19988, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1744497811-plancha-alisadora-gama-alais-ceramic-shine-ion-nano-silver-color-negro-_JM', 'http://http2.mlstatic.com/D_832032-MLA99934524177_112025-I.jpg', 'MLC178457', '2025-11-06T00:43:43.219Z'::timestamptz, '2026-01-21T16:34:09.566Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3309044110', 'ZJAL07177', 'Olla Cera Depilatoria Gama Dep 500 Cc Blanca Premium Rapida Blanco', 17990, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3309044110-olla-cera-depilatoria-gama-dep-500-cc-blanca-premium-rapida-blanco-_JM', 'http://http2.mlstatic.com/D_789094-MLA104252645790_012026-I.jpg', 'MLC178736', '2025-11-06T00:35:37.173Z'::timestamptz, '2026-02-05T11:21:25.928Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314184312', 'JYQY00318', 'Lechero Navideño Lechero De Navidad Ceramica 1 Litro - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314184312-lechero-navideno-lechero-de-navidad-ceramica-1-litro-rojo-_JM', 'http://http2.mlstatic.com/D_756835-MLA97448413661_112025-I.jpg', 'MLC413645', '2025-11-06T16:19:02.651Z'::timestamptz, '2026-01-21T16:44:27.119Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3313979920', 'BAMM00506', 'Bandeja Redonda De Navidad Decorativa De Ceramica 31cm - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3313979920-bandeja-redonda-de-navidad-decorativa-de-ceramica-31cm-rojo-_JM', 'http://http2.mlstatic.com/D_728519-MLA96991767772_112025-I.jpg', 'MLC159287', '2025-11-06T16:38:36.848Z'::timestamptz, '2026-01-21T16:44:34.533Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314222342', 'XREQ69051', 'Bombonera De Navidad Caramelera De Ceramica 3l Pascuero - Rojo', 11990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314222342-bombonera-de-navidad-caramelera-de-ceramica-3l-pascuero-rojo-_JM', 'http://http2.mlstatic.com/D_978768-MLA97448671909_112025-I.jpg', 'MLC413490', '2025-11-06T16:16:54.434Z'::timestamptz, '2026-01-21T16:44:28.344Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314018818', 'YIDU00497', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314018818-caramelera-navidena-galletero-navideno-pascuero-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_865386-MLA97450658851_112025-I.jpg', 'MLC413490', '2025-11-06T16:57:58.497Z'::timestamptz, '2026-01-21T16:44:32.094Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314184428', 'AJSS00466', 'Bandeja Redonda Navideña Viejo Pascuero De Ceramica 33cm - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314184428-bandeja-redonda-navidena-viejo-pascuero-de-ceramica-33cm-rojo-_JM', 'http://http2.mlstatic.com/D_841186-MLA96990462124_112025-I.jpg', 'MLC159287', '2025-11-06T16:22:01.717Z'::timestamptz, '2026-01-21T16:44:25.108Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314019222', 'ULCE00552', 'Bandeja Rectangular Navideña 28cm Ceramica Decorativa - Rojo', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314019222-bandeja-rectangular-navidena-28cm-ceramica-decorativa-rojo-_JM', 'http://http2.mlstatic.com/D_746743-MLA96994229942_112025-I.jpg', 'MLC159287', '2025-11-06T17:07:42.635Z'::timestamptz, '2026-01-21T16:44:29.186Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3313941568', 'WYLD00432', 'Jarra Navideña Jarra Decorativa De Navidad 2l Ceramica - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3313941568-jarra-navidena-jarra-decorativa-de-navidad-2l-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_775182-MLA96992727888_112025-I.jpg', 'MLC179055', '2025-11-06T16:35:54.969Z'::timestamptz, '2026-01-21T16:44:26.770Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312553178', 'JHES69972', 'Cereal Kuna Snack Saludable Sufle Bombas Maní 100g Sin Sellos', 2695, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312553178-cereal-kuna-snack-saludable-sufle-bombas-mani-100g-sin-sellos-_JM', 'http://http2.mlstatic.com/D_873591-MLA99366967368_112025-I.jpg', 'MLC411996', '2025-11-06T14:14:45.637Z'::timestamptz, '2026-01-21T16:44:29.219Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3314092756', 'DNOP00478', 'Bandeja Rectangular De Navidad Decorativa De Ceramica 32cm - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3314092756-bandeja-rectangular-de-navidad-decorativa-de-ceramica-32cm-rojo-_JM', 'http://http2.mlstatic.com/D_729532-MLA96990431132_112025-I.jpg', 'MLC159287', '2025-11-06T16:01:51.286Z'::timestamptz, '2026-01-21T16:44:25.061Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312939340', 'RABL02782', 'Gumis Gomitas De Fruta Kuna Foods Berries - 4 Unidades', 4339, 23, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312939340-gumis-gomitas-de-fruta-kuna-foods-berries-4-unidades-_JM', 'http://http2.mlstatic.com/D_817519-MLC97907472316_112025-I.jpg', 'MLC1426', '2025-11-06T14:04:38.486Z'::timestamptz, '2026-02-04T18:08:18.581Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312848852', 'RABL02782', 'Gumis Gomitas De Fruta Kuna Foods Berries - 4 Unidades Sin Sellos', 4339, 23, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312848852-gumis-gomitas-de-fruta-kuna-foods-berries-4-unidades-sin-sellos-_JM', 'http://http2.mlstatic.com/D_607127-MLA99400499098_112025-I.jpg', 'MLC1426', '2025-11-06T14:04:39.131Z'::timestamptz, '2026-02-04T18:08:15.008Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312926490', 'TYHL02516', 'Galletas Saludables Cookids Cacao Kuna Foods 30 Gr Sin Sellos', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312926490-galletas-saludables-cookids-cacao-kuna-foods-30-gr-sin-sellos-_JM', 'http://http2.mlstatic.com/D_718095-MLA99849462481_112025-I.jpg', 'MLC440921', '2025-11-06T14:10:36.191Z'::timestamptz, '2026-02-04T18:11:59.713Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312952168', 'ZMDU02563', 'Gumis Gomitas De Fruta Kuna Foods Durazno - 4 Unidades', 4315, 23, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312952168-gumis-gomitas-de-fruta-kuna-foods-durazno-4-unidades-_JM', 'http://http2.mlstatic.com/D_684928-MLC98377435047_112025-I.jpg', 'MLC1426', '2025-11-06T14:03:09.139Z'::timestamptz, '2026-02-04T18:09:18.196Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312900288', 'ZMDU02563', 'Gumis Gomitas De Fruta Kuna Foods Durazno - 4 Unidades Sin Sellos', 4315, 23, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312900288-gumis-gomitas-de-fruta-kuna-foods-durazno-4-unidades-sin-sellos-_JM', 'http://http2.mlstatic.com/D_853370-MLA99372604344_112025-I.jpg', 'MLC1426', '2025-11-06T14:03:09.850Z'::timestamptz, '2026-02-04T18:09:13.872Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3313930262', 'VHFT00413', 'Caramelera Navideña Galletero Navideño Pascuero Ceramica 18c - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3313930262-caramelera-navidena-galletero-navideno-pascuero-ceramica-18c-rojo-_JM', 'http://http2.mlstatic.com/D_878086-MLA97452176577_112025-I.jpg', 'MLC413490', '2025-11-06T17:17:48.833Z'::timestamptz, '2026-01-21T16:34:10.571Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312939382', 'QEIT02418', 'Galletas Saludables Cookids Frutilla Kuna Foods 30 Gr', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312939382-galletas-saludables-cookids-frutilla-kuna-foods-30-gr-_JM', 'http://http2.mlstatic.com/D_613451-MLC97907519604_112025-I.jpg', 'MLC440921', '2025-11-06T14:07:06.645Z'::timestamptz, '2026-02-04T18:13:56.283Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312952240', 'LJCQ02473', 'Galletas Saludables Cookids Maní Kuna Foods 30 Gr Sin Sellos', 1100, 17, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312952240-galletas-saludables-cookids-mani-kuna-foods-30-gr-sin-sellos-_JM', 'http://http2.mlstatic.com/D_838444-MLA99366938742_112025-I.jpg', 'MLC440921', '2025-11-06T14:06:25.454Z'::timestamptz, '2026-02-05T11:43:40.239Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312848914', 'INYC02965', 'Galletas Saludables Cookids Limón Kuna Foods 30 Gr Sin Sello', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312848914-galletas-saludables-cookids-limon-kuna-foods-30-gr-sin-sello-_JM', 'http://http2.mlstatic.com/D_750674-MLC97907447974_112025-I.jpg', 'MLC440921', '2025-11-06T14:07:58.574Z'::timestamptz, '2026-02-04T18:11:12.572Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312940368', 'KEIU68812', 'Galletas Saludables Cookids Para Niños De Kuna - Bolsa 30 Gr Tradicional', 1100, 34, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312940368-galletas-saludables-cookids-para-ninos-de-kuna-bolsa-30-gr-tradicional-_JM', 'http://http2.mlstatic.com/D_870270-MLC98363460823_112025-I.jpg', 'MLC418440', '2025-11-06T14:35:28.932Z'::timestamptz, '2026-02-05T22:41:17.657Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3312862456', 'ORYL70611', 'Cereal Kuna Snack Saludable Sufle Bombas Mediterranea 100g', 2831, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3312862456-cereal-kuna-snack-saludable-sufle-bombas-mediterranea-100g-_JM', 'http://http2.mlstatic.com/D_842027-MLC98366008487_112025-I.jpg', 'MLC411996', '2025-11-06T14:22:11.604Z'::timestamptz, '2026-02-04T18:10:41.211Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3330638216', 'CLQS16218', 'Pack 4 40cm Bandeja Antideslizante Garzon Restaurante Negro', 17990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3330638216-pack-4-40cm-bandeja-antideslizante-garzon-restaurante-negro-_JM', 'http://http2.mlstatic.com/D_852738-MLC97657390608_112025-I.jpg', 'MLC159287', '2025-11-12T19:09:35.129Z'::timestamptz, '2026-01-21T16:34:19.124Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745126649', 'CCXI02441', 'Gomita Kuna Foods Snack Infantil Piña Con Fruta Sin Gluten', 4104, 23, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745126649-gomita-kuna-foods-snack-infantil-pina-con-fruta-sin-gluten-_JM', 'http://http2.mlstatic.com/D_716341-MLC98377337147_112025-I.jpg', 'MLC1426', '2025-11-06T13:59:59.052Z'::timestamptz, '2026-02-04T18:08:45.210Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1746216539', 'QKYI02965', 'Te Hibisco Detox Vitalidad 100 Gr Recarga Blends & Tea', 9980, 36, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1746216539-te-hibisco-detox-vitalidad-100-gr-recarga-blends-tea-_JM', 'http://http2.mlstatic.com/D_976317-MLC97558632585_112025-I.jpg', 'MLC178668', '2025-11-07T15:22:38.402Z'::timestamptz, '2026-01-27T11:38:42.633Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3335646838', 'FPUS05968', 'Charqui Lobito La Loberia - 30g', 4861, 54, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3335646838-charqui-lobito-la-loberia-30g-_JM', 'http://http2.mlstatic.com/D_622775-MLC98387766287_112025-I.jpg', 'MLC410901', '2025-11-14T18:58:29.691Z'::timestamptz, '2026-02-05T21:35:42.291Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745126651', 'CCXI02441', 'Gomita Kuna Foods Snack Infantil Piña Con Fruta Sin Gluten 16 g 4 u Sin Sellos', 4104, 23, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745126651-gomita-kuna-foods-snack-infantil-pina-con-fruta-sin-gluten-16g-4u-sin-sellos-_JM', 'http://http2.mlstatic.com/D_950351-MLA99374155606_112025-I.jpg', 'MLC1426', '2025-11-06T13:59:59.739Z'::timestamptz, '2026-02-04T18:08:48.236Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3330613240', 'VBJI84190', 'Pack 3 45cm Bandeja Antideslizante Garzon Restaurant Servir Negro', 18990, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3330613240-pack-3-45cm-bandeja-antideslizante-garzon-restaurant-servir-negro-_JM', 'http://http2.mlstatic.com/D_894566-MLC97657464160_112025-I.jpg', 'MLC174474', '2025-11-12T19:20:35.673Z'::timestamptz, '2026-01-30T03:01:35.987Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745321335', 'LVEU66924', 'Servilletero De Navidad Decorativo De Ceramica 11,5cm - Rojo', 9980, 8, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745321335-servilletero-de-navidad-decorativo-de-ceramica-115cm-rojo-_JM', 'http://http2.mlstatic.com/D_700215-MLA97443969549_112025-I.jpg', 'MLC412712', '2025-11-06T15:40:39.994Z'::timestamptz, '2026-01-21T16:44:25.272Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745324801', 'DGBY00421', 'Bandeja Rectangular De Navidad Decorativa De Ceramica 33cm - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745324801-bandeja-rectangular-de-navidad-decorativa-de-ceramica-33cm-rojo-_JM', 'http://http2.mlstatic.com/D_619782-MLA97449041969_112025-I.jpg', 'MLC159287', '2025-11-06T16:27:34.823Z'::timestamptz, '2026-01-21T16:44:28.812Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3330475496', 'KVLS73134', 'Proteina Aisalada Vainilla 735g 21 Porciones Strive Vainilla', 41990, 57, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3330475496-proteina-aisalada-vainilla-735g-21-porciones-strive-vainilla-_JM', 'http://http2.mlstatic.com/D_795208-MLC97789091574_112025-I.jpg', 'MLC435304', '2025-11-12T20:43:07.025Z'::timestamptz, '2026-02-04T10:58:10.010Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745337031', 'MKVM00432', 'Bombonera De Navidad Caramelera De Navidad 3 Litros - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745337031-bombonera-de-navidad-caramelera-de-navidad-3-litros-rojo-_JM', 'http://http2.mlstatic.com/D_862321-MLA97448390809_112025-I.jpg', 'MLC413490', '2025-11-06T16:35:05.576Z'::timestamptz, '2026-01-21T16:34:11.371Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3330499668', 'XZEZ72280', 'Creatina Monohidratada Micronizada 200 Mesh 60 Porciones Sin Sabor', 27890, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3330499668-creatina-monohidratada-micronizada-200-mesh-60-porciones-sin-sabor-_JM', 'http://http2.mlstatic.com/D_942710-MLC97784049344_112025-I.jpg', 'MLC435304', '2025-11-12T20:19:47.549Z'::timestamptz, '2026-02-05T16:01:27.261Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745707631', 'JOZI66673', 'Frasco De Almacenaje Navideño Ceramica 3,5 L Decorativo - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745707631-frasco-de-almacenaje-navideno-ceramica-35-l-decorativo-rojo-_JM', 'http://http2.mlstatic.com/D_944227-MLA97029023808_112025-I.jpg', 'MLC179058', '2025-11-07T04:35:40.876Z'::timestamptz, '2026-01-21T16:44:19.060Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3330477178', 'URIL05127', 'Pre Entreno Kicker 540g 30 Porciones Frambuesa - Uva Strive Frambuesa - Uva', 29241, 46, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3330477178-pre-entreno-kicker-540g-30-porciones-frambuesa-uva-strive-frambuesa-uva-_JM', 'http://http2.mlstatic.com/D_860866-MLC98128826855_112025-I.jpg', 'MLC3551', '2025-11-12T21:04:13.263Z'::timestamptz, '2026-01-21T16:34:14.404Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745431389', 'ZTDG00360', 'Bandeja Rectangular Decorativa Navidad Ceramica - Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745431389-bandeja-rectangular-decorativa-navidad-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_745423-MLA96993895768_112025-I.jpg', 'MLC159287', '2025-11-06T16:59:15.119Z'::timestamptz, '2026-01-21T16:34:09.232Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745175667', 'QEIT02418', 'Galletas Saludables Cookids Frutilla Kuna Foods 30 Gr Sin Sellos', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745175667-galletas-saludables-cookids-frutilla-kuna-foods-30-gr-sin-sellos-_JM', 'http://http2.mlstatic.com/D_713951-MLA99282273294_112025-I.jpg', 'MLC440921', '2025-11-06T14:07:07.202Z'::timestamptz, '2026-02-04T18:13:59.549Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3330630142', 'XBUA05162', 'Pre Entreno Kicker 540g 30 Porciones Piña - Maracuya Strive Piña - Maracuya', 29241, 47, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3330630142-pre-entreno-kicker-540g-30-porciones-pina-maracuya-strive-pina-maracuya-_JM', 'http://http2.mlstatic.com/D_886054-MLC98128097753_112025-I.jpg', 'MLC3551', '2025-11-12T20:57:41.518Z'::timestamptz, '2026-01-21T18:43:31.660Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745175937', 'JHES69972', 'Cereal Kuna Snack Saludable Sufle Bombas Maní 100g', 2695, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745175937-cereal-kuna-snack-saludable-sufle-bombas-mani-100g-_JM', 'http://http2.mlstatic.com/D_742631-MLC97442170165_112025-I.jpg', 'MLC411996', '2025-11-06T14:14:45.042Z'::timestamptz, '2026-01-21T16:34:18.184Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745126813', 'INYC02965', 'Galletas Saludables Cookids Limón Kuna Foods 30 Gr Sin Sello', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745126813-galletas-saludables-cookids-limon-kuna-foods-30-gr-sin-sello-_JM', 'http://http2.mlstatic.com/D_985533-MLA99765359651_112025-I.jpg', 'MLC440921', '2025-11-06T14:07:59.123Z'::timestamptz, '2026-02-04T18:11:16.285Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745126873', 'TYHL02516', 'Galletas Saludables Cookids Cacao Kuna Foods 30 Gr', 1100, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745126873-galletas-saludables-cookids-cacao-kuna-foods-30-gr-_JM', 'http://http2.mlstatic.com/D_857458-MLC97907516590_112025-I.jpg', 'MLC440921', '2025-11-06T14:10:35.640Z'::timestamptz, '2026-02-04T18:11:54.253Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1745126781', 'LJCQ02473', 'Galletas Saludables Cookids Maní Kuna Foods 30 Gr', 1100, 17, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1745126781-galletas-saludables-cookids-mani-kuna-foods-30-gr-_JM', 'http://http2.mlstatic.com/D_840130-MLC98376219855_112025-I.jpg', 'MLC440921', '2025-11-06T14:06:24.831Z'::timestamptz, '2026-02-05T11:43:40.243Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1754447731', 'FPUS05968', 'Charqui Lobito La Loberia - 30g', 4861, 54, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1754447731-charqui-lobito-la-loberia-30g-_JM', 'http://http2.mlstatic.com/D_773630-MLA99920831501_112025-I.jpg', 'MLC410901', '2025-11-14T18:58:30.258Z'::timestamptz, '2026-02-05T21:35:42.285Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758551719', 'LRKN73744', 'Farmavita Hd Spray Smooth & Protect', 12700, 11, 'active', 'self_service', 'https://articulo.mercadolibre.cl/MLC-1758551719-farmavita-hd-spray-smooth-protect-_JM', 'http://http2.mlstatic.com/D_723154-MLU74051380550_012024-I.jpg', 'MLC1266', '2025-11-18T19:08:13.429Z'::timestamptz, '2026-02-05T13:15:37.252Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343503610', 'URIL05127', 'Pre Entreno Kicker 540g 30 Porciones Frambuesa - Uva Strive Frambuesa - Uva', 29241, 46, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343503610-pre-entreno-kicker-540g-30-porciones-frambuesa-uva-strive-frambuesa-uva-_JM', 'http://http2.mlstatic.com/D_785438-MLA98777443769_112025-I.jpg', 'MLC3551', '2025-11-18T19:58:57.190Z'::timestamptz, '2026-01-21T16:44:23.559Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1754448293', 'GDRV05952', 'Chorizo Chileno Premium 100 Grs Carne De Cerdo La Loberia', 5423, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1754448293-chorizo-chileno-premium-100-grs-carne-de-cerdo-la-loberia-_JM', 'http://http2.mlstatic.com/D_823344-MLC98387933229_112025-I.jpg', 'MLC410901', '2025-11-14T19:15:15.673Z'::timestamptz, '2026-01-21T16:49:08.635Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758539281', 'BHBB07098', 'Crema Oxidante Suprema Color 1000 Ml - Farmavita Tono 20vol 20vol', 4690, 1, 'active', 'self_service', 'https://articulo.mercadolibre.cl/MLC-1758539281-crema-oxidante-suprema-color-1000-ml-farmavita-tono-20vol-20vol-_JM', 'http://http2.mlstatic.com/D_704585-MLA95405941946_102025-I.jpg', 'MLC174669', '2025-11-18T19:14:14.258Z'::timestamptz, '2026-01-21T16:44:31.059Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343535904', 'NXNP07300', 'Farmavita Oxidante Suprema Color 20v 60ml', 650, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343535904-farmavita-oxidante-suprema-color-20v-60ml-_JM', 'http://http2.mlstatic.com/D_778300-MLA100083323223_122025-I.jpg', 'MLC174669', '2025-11-18T19:15:02.095Z'::timestamptz, '2026-01-21T16:44:26.462Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343450388', 'VEON06848', 'Sow Must Hair Leave-in Regenerador Protector Térmico 150ml', 15490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343450388-sow-must-hair-leave-in-regenerador-protector-termico-150ml-_JM', 'http://http2.mlstatic.com/D_758763-MLA99434325822_112025-I.jpg', 'MLC1266', '2025-11-18T19:16:47.435Z'::timestamptz, '2026-02-04T20:22:00.677Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758551677', 'BXBT74191', 'Balanza Pesa Deluxe Scf 2000 Gama Imc Muscular Grasa Oseo Negro', 14500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758551677-balanza-pesa-deluxe-scf-2000-gama-imc-muscular-grasa-oseo-negro-_JM', 'http://http2.mlstatic.com/D_717744-MLA84547977940_052025-I.jpg', 'MLC174421', '2025-11-18T19:06:21.737Z'::timestamptz, '2026-02-05T01:09:55.352Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758600183', 'NQSV75399', 'Gama Tensiometro Muñeca Bp2116 Neutro', 17990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758600183-gama-tensiometro-muneca-bp2116-neutro-_JM', 'http://http2.mlstatic.com/D_809644-MLA92247234410_092025-I.jpg', 'MLC180956', '2025-11-18T19:07:09.807Z'::timestamptz, '2026-02-05T23:40:45.178Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343536102', 'VEON06848', 'Sow Must Hair Leave-in Regenerador Protector Térmico 150ml', 15490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343536102-sow-must-hair-leave-in-regenerador-protector-termico-150ml-_JM', 'http://http2.mlstatic.com/D_771692-MLA95705611752_102025-I.jpg', 'MLC1266', '2025-11-18T19:16:46.813Z'::timestamptz, '2026-02-04T20:22:00.673Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758539925', 'FPKO07509', 'Amethyste Hydrate Shampoo 1000 Ml', 14400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758539925-amethyste-hydrate-shampoo-1000-ml-_JM', 'http://http2.mlstatic.com/D_928728-MLA95846170027_102025-I.jpg', 'MLC8163', '2025-11-18T19:30:19.926Z'::timestamptz, '2026-01-23T03:10:24.767Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1754370449', 'PKTG06001', 'Jamon Serrano 100g - Español Premium - La Loberia', 6000, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1754370449-jamon-serrano-100g-espanol-premium-la-loberia-_JM', 'http://http2.mlstatic.com/D_975847-MLA86176150229_062025-I.jpg', 'MLC416870', '2025-11-14T18:57:37.781Z'::timestamptz, '2026-01-21T16:44:26.548Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343573702', 'NQSV75399', 'Gama Tensiometro Muñeca Bp2116 Neutro Blanco', 17990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343573702-gama-tensiometro-muneca-bp2116-neutro-blanco-_JM', 'http://http2.mlstatic.com/D_809644-MLA92247234410_092025-I.jpg', 'MLC180956', '2025-11-18T19:07:09.185Z'::timestamptz, '2026-02-05T23:40:47.621Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343573790', 'OKNG07290', 'Amethyste Silver Shampoo 1000ml', 15500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343573790-amethyste-silver-shampoo-1000ml-_JM', 'http://http2.mlstatic.com/D_736683-MLA104340235954_012026-I.jpg', 'MLC8163', '2025-11-18T19:10:36.010Z'::timestamptz, '2026-02-04T01:16:53.054Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1754293977', 'GDRV05952', 'Chorizo Chileno Premium 100 Grs Carne De Cerdo La Loberia', 5423, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1754293977-chorizo-chileno-premium-100-grs-carne-de-cerdo-la-loberia-_JM', 'http://http2.mlstatic.com/D_762484-MLA99887638589_112025-I.jpg', 'MLC410901', '2025-11-14T19:15:16.244Z'::timestamptz, '2026-01-21T16:44:33.536Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758591875', 'XZEZ72280', 'Suplemento En Polvo Strive Creatina Monohidratada X 320g', 27890, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758591875-suplemento-en-polvo-strive-creatina-monohidratada-x-320g-_JM', 'http://http2.mlstatic.com/D_718187-MLA98306530092_112025-I.jpg', 'MLC435304', '2025-11-18T21:15:01.672Z'::timestamptz, '2026-02-05T16:01:27.278Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758600211', 'YBHQ74087', 'Secador De Pelo Gama Brilliant Ceramic Ion Aqua Therapy Verde', 18490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758600211-secador-de-pelo-gama-brilliant-ceramic-ion-aqua-therapy-verde-_JM', 'http://http2.mlstatic.com/D_906281-MLA95698025454_102025-I.jpg', 'MLC4597', '2025-11-18T19:09:20.143Z'::timestamptz, '2026-02-03T12:54:59.834Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343551410', 'KVLS73134', 'Proteina Aisalada Vainilla 735g 21 Porciones Strive Vainilla', 41990, 57, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343551410-proteina-aisalada-vainilla-735g-21-porciones-strive-vainilla-_JM', 'http://http2.mlstatic.com/D_958705-MLA98779860877_112025-I.jpg', 'MLC435304', '2025-11-18T20:53:25.203Z'::timestamptz, '2026-02-04T10:58:10.010Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3343450284', 'KYTI07203', 'Gama Plancha Elegance Coconut Almond Color Blanco Blanco', 23990, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3343450284-gama-plancha-elegance-coconut-almond-color-blanco-blanco-_JM', 'http://http2.mlstatic.com/D_683858-MLA96422548391_102025-I.jpg', 'MLC178457', '2025-11-18T19:15:52.663Z'::timestamptz, '2026-02-05T20:52:55.813Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1754293429', 'PKTG06001', 'Jamon Serrano 100g - Español Premium - La Loberia', 6000, 1, 'under_review', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1754293429-jamon-serrano-100g-espanol-premium-la-loberia-_JM', 'http://http2.mlstatic.com/D_624034-MLC98387815749_112025-I.jpg', 'MLC416870', '2025-11-14T18:57:37.150Z'::timestamptz, '2026-01-06T16:04:39.483Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758539117', 'BXBT74191', 'Balanza Pesa Deluxe Scf 2000 Gama Imc Muscular Grasa Oseo Color Negro', 14500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758539117-balanza-pesa-deluxe-scf-2000-gama-imc-muscular-grasa-oseo-color-negro-_JM', 'http://http2.mlstatic.com/D_717744-MLA84547977940_052025-I.jpg', 'MLC174421', '2025-11-18T19:06:22.373Z'::timestamptz, '2026-02-05T01:09:55.335Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758527437', 'EZDX07079', 'Gama Termómetro Ifr Xl-f03 Neutro Blanco', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758527437-gama-termometro-ifr-xl-f03-neutro-blanco-_JM', 'http://http2.mlstatic.com/D_814059-MLC104337629914_012026-I.jpg', 'MLC66176', '2025-11-18T19:17:51.026Z'::timestamptz, '2026-01-25T02:36:03.017Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3356134646', 'HUWJ09388', 'Lechero Navideño 450 Ml Viejo Pascuero Navidad Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3356134646-lechero-navideno-450-ml-viejo-pascuero-navidad-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_679972-MLC99364102562_112025-I.jpg', 'MLC413645', '2025-11-24T14:06:06.842Z'::timestamptz, '2026-01-21T16:44:32.069Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758477325', 'FPKO07509', 'Amethyste Hydrate Shampoo 1000 Ml', 14400, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758477325-amethyste-hydrate-shampoo-1000-ml-_JM', 'http://http2.mlstatic.com/D_611239-MLA99884611593_112025-I.jpg', 'MLC8163', '2025-11-18T19:30:20.512Z'::timestamptz, '2026-01-23T20:58:05.945Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3356587742', 'OYZI09388', 'Salero Y Pimentero Navideño Viejito Pascuero De Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3356587742-salero-y-pimentero-navideno-viejito-pascuero-de-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_806579-MLC99830136327_112025-I.jpg', 'MLC180830', '2025-11-24T14:41:50.900Z'::timestamptz, '2026-01-21T16:44:15.104Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3344359506', 'GXJW76978', 'Revelador Wella Color Touch Emulsión Color Touch 1,9% 120ml Sin Tono', 3018, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3344359506-revelador-wella-color-touch-emulsion-color-touch-19-120ml-sin-tono-_JM', 'http://http2.mlstatic.com/D_938649-MLA95532971904_102025-I.jpg', 'MLC174669', '2025-11-19T10:42:16.635Z'::timestamptz, '2026-01-21T16:34:10.701Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758361293', 'OKNG07290', 'Shampoo Silver Amethyste 1000ml Anti Amarillo Naranja Violet', 15500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758361293-shampoo-silver-amethyste-1000ml-anti-amarillo-naranja-violet-_JM', 'http://http2.mlstatic.com/D_885096-MLA99614450844_122025-I.jpg', 'MLC8163', '2025-11-18T19:10:36.665Z'::timestamptz, '2026-02-04T01:16:53.046Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758923363', 'GXJW76978', 'Revelador Wella Color Touch Emulsión Color Touch 1,9% 6vol 120ml', 3018, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758923363-revelador-wella-color-touch-emulsion-color-touch-19-6vol-120ml-_JM', 'http://http2.mlstatic.com/D_639512-MLA100060711125_122025-I.jpg', 'MLC174669', '2025-11-19T10:42:17.220Z'::timestamptz, '2026-01-21T16:34:14.089Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758424809', 'BHBB07098', 'Crema Oxidante Suprema Color 1000 Ml - Farmavita Tono 20vol', 4690, 1, 'active', 'self_service', 'https://articulo.mercadolibre.cl/MLC-1758424809-crema-oxidante-suprema-color-1000-ml-farmavita-tono-20vol-_JM', 'http://http2.mlstatic.com/D_726539-MLA101784536366_122025-I.jpg', 'MLC174669', '2025-11-18T19:14:14.857Z'::timestamptz, '2026-01-21T16:44:17.591Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758527247', 'KYTI07203', 'Gama Plancha Elegance Coconut Almond - Negro', 23990, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758527247-gama-plancha-elegance-coconut-almond-negro-_JM', 'http://http2.mlstatic.com/D_895614-MLA91654939220_092025-I.jpg', 'MLC178457', '2025-11-18T19:15:53.182Z'::timestamptz, '2026-02-05T20:52:55.814Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3356679038', 'GHMM77218', 'Pocillo De Navidad Cuenco Ceramica Viejo Pascuero Rojo', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3356679038-pocillo-de-navidad-cuenco-ceramica-viejo-pascuero-rojo-_JM', 'http://http2.mlstatic.com/D_609254-MLC100595650780_122025-I.jpg', 'MLC440225', '2025-11-24T14:56:19.142Z'::timestamptz, '2026-01-21T16:44:19.485Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3356135160', 'CAPE76295', 'Pocillo De Navidad 1 Litro Viejito Pascuero Triple Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3356135160-pocillo-de-navidad-1-litro-viejito-pascuero-triple-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_635077-MLC99850044259_112025-I.jpg', 'MLC440225', '2025-11-24T14:24:07.691Z'::timestamptz, '2026-01-21T16:44:19.975Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3356587408', 'UDVY76488', 'Lechero Navideño Viejo Pascuero 450 Ml Ceramica Navidad Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3356587408-lechero-navideno-viejo-pascuero-450-ml-ceramica-navidad-rojo-_JM', 'http://http2.mlstatic.com/D_879628-MLC99368561122_112025-I.jpg', 'MLC413645', '2025-11-24T14:30:39.318Z'::timestamptz, '2026-01-21T16:44:26.209Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1760755829', 'XBUA05162', 'Pre Entreno Kicker 540g 30 Porciones Piña - Maracuya Strive Piña - Maracuya', 29241, 47, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1760755829-pre-entreno-kicker-540g-30-porciones-pina-maracuya-strive-pina-maracuya-_JM', 'http://http2.mlstatic.com/D_757151-MLA98965585759_112025-I.jpg', 'MLC3551', '2025-11-20T15:36:41.677Z'::timestamptz, '2026-01-21T18:43:31.656Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3356677914', 'NLZC76139', 'Bandeja Doble Navideña 26cm Viejo Pascuero Navidad Ceramica Blanco', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3356677914-bandeja-doble-navidena-26cm-viejo-pascuero-navidad-ceramica-blanco-_JM', 'http://http2.mlstatic.com/D_607541-MLC99852473131_112025-I.jpg', 'MLC174474', '2025-11-24T14:37:18.689Z'::timestamptz, '2026-01-21T16:44:31.418Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3356587176', 'EUCL09390', 'Pocillo Navideño De Ceramica Viejito Pascuero 450 Ml Navidad Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3356587176-pocillo-navideno-de-ceramica-viejito-pascuero-450-ml-navidad-rojo-_JM', 'http://http2.mlstatic.com/D_784170-MLC99366512300_112025-I.jpg', 'MLC440225', '2025-11-24T14:22:11.606Z'::timestamptz, '2026-01-21T16:44:29.570Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758424729', 'LRKN73744', 'Farmavita Hd Spray Smooth & Protect', 12700, 11, 'active', 'self_service', 'https://articulo.mercadolibre.cl/MLC-1758424729-farmavita-hd-spray-smooth-protect-_JM', 'http://http2.mlstatic.com/D_723154-MLU74051380550_012024-I.jpg', 'MLC1266', '2025-11-18T19:08:14.036Z'::timestamptz, '2026-02-05T13:15:37.352Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758425143', 'EZDX07079', 'Gama Termómetro Ifr Xl-f03 Neutro', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758425143-gama-termometro-ifr-xl-f03-neutro-_JM', 'http://http2.mlstatic.com/D_722378-MLA87782257328_072025-I.jpg', 'MLC66176', '2025-11-18T19:17:51.523Z'::timestamptz, '2026-01-25T02:36:03.019Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758361439', 'NXNP07300', 'Farmavita Oxidante Suprema Color 20v 60ml Sin Tono', 650, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758361439-farmavita-oxidante-suprema-color-20v-60ml-sin-tono-_JM', 'http://http2.mlstatic.com/D_655899-MLA96654082283_102025-I.jpg', 'MLC174669', '2025-11-18T19:15:01.480Z'::timestamptz, '2026-01-21T16:44:34.541Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1758361263', 'YBHQ74087', 'Secador De Pelo Gama Brilliant Ceramic Ion Aqua Therapy Color Verde Claro', 18490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1758361263-secador-de-pelo-gama-brilliant-ceramic-ion-aqua-therapy-color-verde-claro-_JM', 'http://http2.mlstatic.com/D_816449-MLA100005480939_122025-I.jpg', 'MLC4597', '2025-11-18T19:09:20.745Z'::timestamptz, '2026-02-03T12:54:59.846Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1765051811', 'VTUA09326', 'Bombonera De Navidad Caramelera De Navidad 2.5 Litros Rojo', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1765051811-bombonera-de-navidad-caramelera-de-navidad-25-litros-rojo-_JM', 'http://http2.mlstatic.com/D_858913-MLC99027803076_112025-I.jpg', 'MLC413490', '2025-11-24T13:48:55.967Z'::timestamptz, '2026-01-21T16:44:28.097Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3367378438', 'JOZI75415', 'Pocillo Navideño Cerámica Bazaro Viejo Pascuero Decorativo 3d Rojo', 12990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3367378438-pocillo-navideno-ceramica-bazaro-viejo-pascuero-decorativo-3d-rojo-_JM', 'http://http2.mlstatic.com/D_919357-MLA99735472739_112025-I.jpg', 'MLC440225', '2025-11-27T16:57:18.502Z'::timestamptz, '2026-01-21T16:44:14.296Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3355829718', 'BXBT76442', 'Bombonera Navideña Viejo Pascuero Osito 4,5 Litros Ceramica Rojo', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3355829718-bombonera-navidena-viejo-pascuero-osito-45-litros-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_751903-MLC99831131353_112025-I.jpg', 'MLC413490', '2025-11-24T14:58:42.089Z'::timestamptz, '2026-01-21T16:34:09.398Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3362779668', 'CKWX10493', 'Sandwichera Thomas Th-952 750w, Capacidad Para 2 Panes Color Blanco', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3362779668-sandwichera-thomas-th-952-750w-capacidad-para-2-panes-color-blanco-_JM', 'http://http2.mlstatic.com/D_824801-MLA99455772504_112025-I.jpg', 'MLC162502', '2025-11-26T11:48:26.593Z'::timestamptz, '2026-02-05T14:57:22.304Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1765091121', 'YLZQ09763', 'Lechero Navideño Viejito Pascuero Ceramica Navidad Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1765091121-lechero-navideno-viejito-pascuero-ceramica-navidad-rojo-_JM', 'http://http2.mlstatic.com/D_990564-MLC99368556856_112025-I.jpg', 'MLC413645', '2025-11-24T14:26:01.806Z'::timestamptz, '2026-01-21T16:44:29.246Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1764987263', 'ZIVO77835', 'Bandeja Triple Navideña Viejito Pascuero 28,5cm Ceramica Rojo', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1764987263-bandeja-triple-navidena-viejito-pascuero-285cm-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_713117-MLC99349576550_112025-I.jpg', 'MLC159287', '2025-11-24T13:56:50.362Z'::timestamptz, '2026-01-21T16:49:08.304Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3367104564', 'ECBV09841', '2 Tazas Navideñas 400 Ml Con Cucharilla De Ceramica Rojo Viejito Pascuero', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3367104564-2-tazas-navidenas-400-ml-con-cucharilla-de-ceramica-rojo-viejito-pascuero-_JM', 'http://http2.mlstatic.com/D_938636-MLA99729965531_112025-I.jpg', 'MLC159290', '2025-11-27T15:39:00.702Z'::timestamptz, '2026-01-21T16:44:21.099Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1766323507', 'CBQU76899', 'Reloj De Cocina Análogo Grande Dorado Reloj De Pared 60cm - Dorado - Blanco', 19990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1766323507-reloj-de-cocina-analogo-grande-dorado-reloj-de-pared-60cm-dorado-blanco-_JM', 'http://http2.mlstatic.com/D_771218-MLA99009698406_112025-I.jpg', 'MLC3948', '2025-11-25T14:17:43.993Z'::timestamptz, '2026-01-21T16:34:12.169Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3355994114', 'YVHL78724', 'Bandeja Triple Navideña Viejo Pascuero 38cm Navidad Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3355994114-bandeja-triple-navidena-viejo-pascuero-38cm-navidad-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_755255-MLC99852449649_112025-I.jpg', 'MLC159287', '2025-11-24T14:33:51.719Z'::timestamptz, '2026-01-21T16:44:28.532Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1764910759', 'CPDT76932', 'Bandeja Rectangular 38 Cm Viejo Pascuero 3 Navidad Ceramica Blanco', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1764910759-bandeja-rectangular-38-cm-viejo-pascuero-3-navidad-ceramica-blanco-_JM', 'http://http2.mlstatic.com/D_965020-MLC99370248022_112025-I.jpg', 'MLC159287', '2025-11-24T14:39:39.748Z'::timestamptz, '2026-01-21T16:44:22.305Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1765052453', 'JIBZ09020', 'Servilletero Navideño Viejito Pascuero Ceramica 12cm Navidad Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1765052453-servilletero-navideno-viejito-pascuero-ceramica-12cm-navidad-rojo-_JM', 'http://http2.mlstatic.com/D_746794-MLC99848553293_112025-I.jpg', 'MLC412712', '2025-11-24T14:09:18.777Z'::timestamptz, '2026-01-21T16:44:28.965Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1765104441', 'YBLK09272', 'Bombonera Navideña Viejo Pascuero Ceramica 7 Rojo', 12990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1765104441-bombonera-navidena-viejo-pascuero-ceramica-7-rojo-_JM', 'http://http2.mlstatic.com/D_822391-MLC100698705550_122025-I.jpg', 'MLC413490', '2025-11-24T15:00:41.699Z'::timestamptz, '2026-01-21T16:44:32.507Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3355995388', 'JOZI75415', 'Pocillo Navideño De Ceramica Viejo Pascuero 4 Rojo', 12990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3355995388-pocillo-navideno-de-ceramica-viejo-pascuero-4-rojo-_JM', 'http://http2.mlstatic.com/D_811713-MLC101195578069_122025-I.jpg', 'MLC440225', '2025-11-24T14:54:16.397Z'::timestamptz, '2026-01-21T16:44:22.336Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1765092081', 'LPDY76950', 'Pocillo Triple Navideño Viejo Pascuero 300 Ml Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1765092081-pocillo-triple-navideno-viejo-pascuero-300-ml-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_857109-MLC99854717623_112025-I.jpg', 'MLC440225', '2025-11-24T14:47:57.062Z'::timestamptz, '2026-01-21T16:44:30.011Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1765089819', 'ECBV09841', 'Set 2 Tazas Navideñas 400 Ml Con Cucharilla De Ceramica Rojo Viejito Pascuero', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1765089819-set-2-tazas-navidenas-400-ml-con-cucharilla-de-ceramica-rojo-viejito-pascuero-_JM', 'http://http2.mlstatic.com/D_810678-MLC99483444633_112025-I.jpg', 'MLC159290', '2025-11-24T13:42:39.013Z'::timestamptz, '2026-01-21T16:44:29.287Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3367325594', 'YBLK09272', 'Bombonera Navideña Viejo Pascuero Ceramica 7 Rojo', 12990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3367325594-bombonera-navidena-viejo-pascuero-ceramica-7-rojo-_JM', 'http://http2.mlstatic.com/D_603270-MLA99250224408_112025-I.jpg', 'MLC413490', '2025-11-27T16:19:30.740Z'::timestamptz, '2026-01-21T16:44:26.084Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3362804440', 'CKWX10493', 'Sandwichera Thomas Th-952 750w, Capacidad Para 2 Panesblanco Blanco', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3362804440-sandwichera-thomas-th-952-750w-capacidad-para-2-panesblanco-blanco-_JM', 'http://http2.mlstatic.com/D_960959-MLA94299587561_102025-I.jpg', 'MLC162502', '2025-11-26T11:48:26.096Z'::timestamptz, '2026-02-05T14:57:22.301Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1765090943', 'HAPI09632', 'Frasco De Almacenaje Navideño Viejo Pascuero Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1765090943-frasco-de-almacenaje-navideno-viejo-pascuero-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_721790-MLC99850065181_112025-I.jpg', 'MLC392281', '2025-11-24T14:19:14.475Z'::timestamptz, '2026-01-21T16:34:08.766Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3355918292', 'DBVN75587', 'Pocillo Navideño Viejito Pascuero 12cm Ceramica Navidad Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3355918292-pocillo-navideno-viejito-pascuero-12cm-ceramica-navidad-rojo-_JM', 'http://http2.mlstatic.com/D_723227-MLC99365997032_112025-I.jpg', 'MLC440225', '2025-11-24T14:11:27.009Z'::timestamptz, '2026-01-21T16:44:22.437Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1764909625', 'TQWD76333', 'Tetera Decorativa Navideña Viejo Pascuero 1,2 L Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1764909625-tetera-decorativa-navidena-viejo-pascuero-12-l-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_865832-MLC99842670683_112025-I.jpg', 'MLC440228', '2025-11-24T13:59:28.789Z'::timestamptz, '2026-01-21T16:34:11.941Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3369683590', 'ZOFN11487', 'Manillar Hoco Ca73 Para Motocicleta, Soporte Para Vehículo, Negro/rojo', 6090, 104, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3369683590-manillar-hoco-ca73-para-motocicleta-soporte-para-vehiculo-negrorojo-_JM', 'http://http2.mlstatic.com/D_930240-MLA99420348658_112025-I.jpg', 'MLC440666', '2025-11-28T14:48:58.619Z'::timestamptz, '2026-01-30T12:14:08.659Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1769054329', 'YLZQ09763', 'Lechero Navideño De Ceramica Viejito Pascuero 3 Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1769054329-lechero-navideno-de-ceramica-viejito-pascuero-3-rojo-_JM', 'http://http2.mlstatic.com/D_737237-MLA99240130558_112025-I.jpg', 'MLC413645', '2025-11-27T13:47:49.353Z'::timestamptz, '2026-01-21T16:44:22.393Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1771784939', 'ZIVO77835', 'Bandeja Triple Navideña Viejito Pascuero 28,5cm Ceramica Rojo', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1771784939-bandeja-triple-navidena-viejito-pascuero-285cm-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_960049-MLA99470540388_112025-I.jpg', 'MLC159287', '2025-11-30T12:16:52.220Z'::timestamptz, '2026-01-21T16:34:13.386Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366559850', 'HAPI09632', 'Frasco De Almacenaje Navideño De Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366559850-frasco-de-almacenaje-navideno-de-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_985232-MLA99241597756_112025-I.jpg', 'MLC392281', '2025-11-27T13:57:22.099Z'::timestamptz, '2026-01-21T16:44:26.095Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1771396317', 'LPDY76950', 'Pocillo Triple Navideño Viejo Pascuero 300 Ml Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1771396317-pocillo-triple-navideno-viejo-pascuero-300-ml-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_754769-MLA99450903526_112025-I.jpg', 'MLC440225', '2025-11-30T00:40:54.570Z'::timestamptz, '2026-01-21T16:44:26.515Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366846252', 'OYZI09388', 'Salero Y Pimentero Navideño Viejito Pascuero Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366846252-salero-y-pimentero-navideno-viejito-pascuero-rojo-_JM', 'http://http2.mlstatic.com/D_999406-MLA99245479092_112025-I.jpg', 'MLC180830', '2025-11-27T14:55:47.464Z'::timestamptz, '2026-01-21T16:44:33.104Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366903004', 'JIBZ09020', 'Servilletero Navideño De Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366903004-servilletero-navideno-de-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_889120-MLA99731172279_112025-I.jpg', 'MLC412712', '2025-11-27T16:00:19.981Z'::timestamptz, '2026-01-21T16:34:09.911Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366948074', 'EUCL09390', 'Pocillo Navideño Cerámica Bazaro Viejito Pascuero Rojo 450ml', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366948074-pocillo-navideno-ceramica-bazaro-viejito-pascuero-rojo-450ml-_JM', 'http://http2.mlstatic.com/D_741074-MLA99726890587_112025-I.jpg', 'MLC440225', '2025-11-27T14:46:50.486Z'::timestamptz, '2026-01-21T16:44:34.302Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1771974261', 'DBVN75587', 'Pocillo Navideño Viejito Pascuero 12cm Ceramica Navidad Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1771974261-pocillo-navideno-viejito-pascuero-12cm-ceramica-navidad-rojo-_JM', 'http://http2.mlstatic.com/D_662827-MLA99478842240_112025-I.jpg', 'MLC440225', '2025-11-30T17:07:38.296Z'::timestamptz, '2026-01-21T16:44:26.764Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366584606', 'BOLC76754', 'Candelabro O Porta Velas De Vidrio 14cm 2,5cm Diametro Transparente', 4990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366584606-candelabro-o-porta-velas-de-vidrio-14cm-25cm-diametro-transparente-_JM', 'http://http2.mlstatic.com/D_767329-MLA99723527807_112025-I.jpg', 'MLC413412', '2025-11-27T13:55:26.139Z'::timestamptz, '2026-01-31T20:59:02.393Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366938210', 'YVHL78724', 'Bandeja Triple Navideña Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366938210-bandeja-triple-navidena-rojo-_JM', 'http://http2.mlstatic.com/D_685790-MLA99246892524_112025-I.jpg', 'MLC159287', '2025-11-27T15:12:14.554Z'::timestamptz, '2026-01-21T16:44:19.733Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366890824', 'NLZC76139', 'Bandeja Doble Cerámica Navideña Bazaro Viejo Pascuero 26cm Blanco', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366890824-bandeja-doble-ceramica-navidena-bazaro-viejo-pascuero-26cm-blanco-_JM', 'http://http2.mlstatic.com/D_827868-MLA99731671985_112025-I.jpg', 'MLC174474', '2025-11-27T16:07:01.899Z'::timestamptz, '2026-01-21T16:49:08.445Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1774136611', 'VTUA09326', 'Bombonera De Navidad Caramelera De Navidad 2.5 Litros Rojo', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1774136611-bombonera-de-navidad-caramelera-de-navidad-25-litros-rojo-_JM', 'http://http2.mlstatic.com/D_972454-MLA100194585457_122025-I.jpg', 'MLC413490', '2025-12-02T21:22:54.987Z'::timestamptz, '2026-01-21T16:44:33.086Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1769022343', 'GHMM77218', 'Cuenco Cerámica Bazaro Viejo Pascuero Rojo Navidad', 9980, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1769022343-cuenco-ceramica-bazaro-viejo-pascuero-rojo-navidad-_JM', 'http://http2.mlstatic.com/D_871698-MLA99720777289_112025-I.jpg', 'MLC440225', '2025-11-27T13:31:14.804Z'::timestamptz, '2026-01-21T16:34:14.530Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366888854', 'CPDT76932', 'Bandeja Rectangular Navideña Viejo Pascuero 3 Blanco', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366888854-bandeja-rectangular-navidena-viejo-pascuero-3-blanco-_JM', 'http://http2.mlstatic.com/D_878127-MLA99729261179_112025-I.jpg', 'MLC159287', '2025-11-27T15:31:07.857Z'::timestamptz, '2026-01-21T16:44:28.294Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3374268294', 'TQWD76333', 'Tetera Decorativa Navideña Viejo Pascuero 1,2 L Ceramica Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3374268294-tetera-decorativa-navidena-viejo-pascuero-12-l-ceramica-rojo-_JM', 'http://http2.mlstatic.com/D_959918-MLA99475710470_112025-I.jpg', 'MLC440228', '2025-11-30T19:58:27.293Z'::timestamptz, '2026-01-21T16:34:10.563Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366674244', 'BXBT76442', 'Bombonera Navideña Viejo Pascuero Osito Rojo', 12990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366674244-bombonera-navidena-viejo-pascuero-osito-rojo-_JM', 'http://http2.mlstatic.com/D_986604-MLA99240042670_112025-I.jpg', 'MLC413490', '2025-11-27T13:49:17.164Z'::timestamptz, '2026-01-21T16:44:26.294Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1770059229', 'ZOFN11487', 'Manillar Hoco Ca73 Para Motocicleta, Soporte Para Vehículo Negro', 6090, 104, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1770059229-manillar-hoco-ca73-para-motocicleta-soporte-para-vehiculo-negro-_JM', 'http://http2.mlstatic.com/D_765591-MLA93514440121_092025-I.jpg', 'MLC440666', '2025-11-28T14:48:58.026Z'::timestamptz, '2026-01-30T12:14:08.655Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366584750', 'HUWJ09388', 'Lechero Navideño De Ceramica 450 Ml Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366584750-lechero-navideno-de-ceramica-450-ml-rojo-_JM', 'http://http2.mlstatic.com/D_842916-MLA99241193294_112025-I.jpg', 'MLC413645', '2025-11-27T13:57:50.115Z'::timestamptz, '2026-01-21T16:34:17.176Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3366596834', 'CAPE76295', 'Pocillo Navidad 1 Litro Bazaro Cerámica Viejito Pascuero Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3366596834-pocillo-navidad-1-litro-bazaro-ceramica-viejito-pascuero-rojo-_JM', 'http://http2.mlstatic.com/D_757889-MLA99240061426_112025-I.jpg', 'MLC440225', '2025-11-27T13:48:09.973Z'::timestamptz, '2026-01-21T16:44:23.326Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3473774106', 'ZVYA23993', 'Sow Vitamin Hair Shampoo Nutritivo Cabello Seco-dañado 250ml', 17990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3473774106-sow-vitamin-hair-shampoo-nutritivo-cabello-seco-danado-250ml-_JM', 'http://http2.mlstatic.com/D_893601-MLC104798960037_012026-I.jpg', 'MLC8163', '2025-12-30T20:12:18.514Z'::timestamptz, '2026-01-21T16:44:34.762Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806635647', 'NKWG23165', 'Boffel Hair Medium 300gr Cera Para El Cabello', 16990, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806635647-boffel-hair-medium-300gr-cera-para-el-cabello-_JM', 'http://http2.mlstatic.com/D_657771-MLU78111912473_082024-I.jpg', 'MLC388015', '2025-12-30T12:52:44.392Z'::timestamptz, '2026-02-04T17:32:00.213Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906280818', 'USJD45788', 'Audifonos Hoco W35 Air Triumph Over Ear Bluetooth Silver Color Plata', 12425, 16, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906280818-audifonos-hoco-w35-air-triumph-over-ear-bluetooth-silver-color-plata-_JM', 'http://http2.mlstatic.com/D_777719-MLA99443800116_112025-I.jpg', 'MLC3697', '2025-05-30T12:15:59.444Z'::timestamptz, '2026-01-27T19:33:28.083Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806518635', 'OOIJ23165', 'Decolorante En Polvo Farmavita Supremacolor Azul Sin Amoniaco Cabello 500g', 15990, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806518635-decolorante-en-polvo-farmavita-supremacolor-azul-sin-amoniaco-cabello-500g-_JM', 'http://http2.mlstatic.com/D_953432-MLA99468564524_112025-I.jpg', 'MLC174669', '2025-12-30T12:31:05.167Z'::timestamptz, '2026-02-04T19:46:57.325Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3473774386', 'JNNO23986', 'Sow Vitamin Hair Máscara Cabello Seco Y Dañado 250ml', 24207, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3473774386-sow-vitamin-hair-mascara-cabello-seco-y-danado-250ml-_JM', 'http://http2.mlstatic.com/D_903141-MLA103957902287_012026-I.jpg', 'MLC1266', '2025-12-30T20:30:08.943Z'::timestamptz, '2026-02-05T23:20:57.223Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1621317911', 'TVZP47809', 'Audífono Bluetooth Hoco W35 Air 45hrs Para iPhone O Android Negro', 13090, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1621317911-audifono-bluetooth-hoco-w35-air-45hrs-para-iphone-o-android-negro-_JM', 'http://http2.mlstatic.com/D_744029-MLU77449872022_072024-I.jpg', 'MLC3697', '2025-05-30T12:08:20.589Z'::timestamptz, '2026-02-04T03:15:29.093Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906319330', 'TVZP47809', 'Audífono Bluetooth Hoco W35 Air 45hrs Para iPhone O Android Color Negro Luz Bl', 13090, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906319330-audifono-bluetooth-hoco-w35-air-45hrs-para-iphone-o-android-color-negro-luz-bl-_JM', 'http://http2.mlstatic.com/D_954606-MLA99987793805_112025-I.jpg', 'MLC3697', '2025-05-30T12:08:21.188Z'::timestamptz, '2026-02-04T03:15:29.093Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3453199524', 'TXKF37830', 'Tonico Anticaída Cafeina Liquida 200ml Alpecin Calvicie', 11490, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3453199524-tonico-anticaida-cafeina-liquida-200ml-alpecin-calvicie-_JM', 'http://http2.mlstatic.com/D_718437-MLA99828467727_112025-I.jpg', 'MLC1266', '2025-12-22T18:40:47.814Z'::timestamptz, '2026-01-21T16:44:33.785Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806531627', 'TGMU22670', 'Afeitadora Rasuradora Gama Eggo Corporal Usb Masculina Color Negro', 26500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806531627-afeitadora-rasuradora-gama-eggo-corporal-usb-masculina-color-negro-_JM', 'http://http2.mlstatic.com/D_764968-MLA96321395105_102025-I.jpg', 'MLC431603', '2025-12-30T12:41:14.348Z'::timestamptz, '2026-02-02T20:58:27.312Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806635897', 'XZNN23889', 'Secador De Pelo Ga.ma Italymicro Glitt Diamond Titan Keratin Gris', 24108, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806635897-secador-de-pelo-gama-italymicro-glitt-diamond-titan-keratin-gris-_JM', 'http://http2.mlstatic.com/D_834796-MLA99505398024_112025-I.jpg', 'MLC4597', '2025-12-30T13:04:31.081Z'::timestamptz, '2026-01-31T19:46:01.549Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806518691', 'UAZJ23521', 'Ondulador Rizador Gama New 25 Mm Coconut-almond', 22990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806518691-ondulador-rizador-gama-new-25-mm-coconut-almond-_JM', 'http://http2.mlstatic.com/D_862032-MLU72646941671_112023-I.jpg', 'MLC43660', '2025-12-30T12:36:53.454Z'::timestamptz, '2026-02-03T23:30:32.151Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2906194082', 'USJD45788', 'Audifonos Hoco W35 Air Triumph Over Ear Bluetooth Silver Col Plata', 12425, 16, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2906194082-audifonos-hoco-w35-air-triumph-over-ear-bluetooth-silver-col-plata-_JM', 'http://http2.mlstatic.com/D_645539-MLU75348815074_032024-I.jpg', 'MLC3697', '2025-05-30T12:15:58.919Z'::timestamptz, '2026-01-27T19:33:28.071Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2997337764', 'SFQB84518', 'Auriculares Gamer Inalámbricos Hoco Bluetooth W35 Max Plateado', 13990, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2997337764-auriculares-gamer-inalambricos-hoco-bluetooth-w35-max-plateado-_JM', 'http://http2.mlstatic.com/D_961954-MLA99963506987_112025-I.jpg', 'MLC441017', '2025-07-29T15:01:47.947Z'::timestamptz, '2026-02-05T23:09:58.783Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806622557', 'YKHD92469', 'Back Bar Shampoo Revitalizing N°4 Natural Herbs 1000ml Detox', 10751, 15, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806622557-back-bar-shampoo-revitalizing-n4-natural-herbs-1000ml-detox-_JM', 'http://http2.mlstatic.com/D_744714-MLA99416625672_112025-I.jpg', 'MLC8163', '2025-12-30T12:48:42.024Z'::timestamptz, '2026-02-05T22:36:03.646Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806531595', 'UAZJ23521', 'Ondulador Rizador Gama New 25 Mm Coconut-almond', 22990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806531595-ondulador-rizador-gama-new-25-mm-coconut-almond-_JM', 'http://http2.mlstatic.com/D_950676-MLA105391446598_012026-I.jpg', 'MLC43660', '2025-12-30T12:36:54.076Z'::timestamptz, '2026-02-03T23:30:32.147Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3449247802', 'WMPT68039', 'Bandeja Rectangular De Navidad Decorativa De Ceramica 32,5cm Rojo', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3449247802-bandeja-rectangular-de-navidad-decorativa-de-ceramica-325cm-rojo-_JM', 'http://http2.mlstatic.com/D_800641-MLA101487565514_122025-I.jpg', 'MLC159287', '2025-12-20T13:54:51.918Z'::timestamptz, '2026-01-21T16:44:24.493Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806609777', 'NKWG23165', 'Boffel Hair Medium 300gr Cera Para El Cabello', 16990, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806609777-boffel-hair-medium-300gr-cera-para-el-cabello-_JM', 'http://http2.mlstatic.com/D_657771-MLU78111912473_082024-I.jpg', 'MLC388015', '2025-12-30T12:52:45.022Z'::timestamptz, '2026-02-04T17:32:00.211Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1797140427', 'EZGH00432', 'Plato De Navidad Decorativo De Ceramica Grande 31,5cm Rojo Viejo Pascuero', 9980, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1797140427-plato-de-navidad-decorativo-de-ceramica-grande-315cm-rojo-viejo-pascuero-_JM', 'http://http2.mlstatic.com/D_808299-MLA102303108861_122025-I.jpg', 'MLC159292', '2025-12-23T18:57:52.114Z'::timestamptz, '2026-01-21T16:44:22.215Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2997532814', 'SFQB84518', 'Audifonos Bluetooth Marca Hoco / Modelo W35 Max Over Ear - P Plateado', 13990, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2997532814-audifonos-bluetooth-marca-hoco-modelo-w35-max-over-ear-p-plateado-_JM', 'http://http2.mlstatic.com/D_717528-MLC88801144968_082025-I.jpg', 'MLC441017', '2025-07-29T15:01:47.427Z'::timestamptz, '2026-02-05T23:09:58.786Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806622427', 'OOIJ23165', 'Decolorante Suprema Color 500 Grs Farmavita Tono Azul Azul', 15990, 4, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806622427-decolorante-suprema-color-500-grs-farmavita-tono-azul-azul-_JM', 'http://http2.mlstatic.com/D_953432-MLA99468564524_112025-I.jpg', 'MLC174669', '2025-12-30T12:31:04.577Z'::timestamptz, '2026-02-04T19:46:57.342Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806479705', 'COSZ23290', 'Acondicionador Aceite Aguacate 1l Nutre Hidrata Cabello Pelo', 13200, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806479705-acondicionador-aceite-aguacate-1l-nutre-hidrata-cabello-pelo-_JM', 'http://http2.mlstatic.com/D_660248-MLA99920847121_112025-I.jpg', 'MLC418404', '2025-12-30T12:38:51.962Z'::timestamptz, '2026-02-05T17:35:20.874Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806475301', 'ZVYA23993', 'Sow Vitamin Hair Shampoo Nutritivo Cabello Seco-dañado 250ml', 17990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806475301-sow-vitamin-hair-shampoo-nutritivo-cabello-seco-danado-250ml-_JM', 'http://http2.mlstatic.com/D_815250-MLA100173138725_122025-I.jpg', 'MLC8163', '2025-12-30T20:12:19.073Z'::timestamptz, '2026-01-21T22:52:21.493Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806492639', 'WVIV91185', 'Afeitadora Gama Gsh987 Sport Usb Apta Para Ducha Inalámbrica Azul', 46590, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806492639-afeitadora-gama-gsh987-sport-usb-apta-para-ducha-inalambrica-azul-_JM', 'http://http2.mlstatic.com/D_606042-MLA99402762046_112025-I.jpg', 'MLC431603', '2025-12-30T12:33:51.261Z'::timestamptz, '2026-01-21T16:34:10.222Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806453661', 'CYQM23183', 'Cepillo Secador Modelador Gama Glamour Pink Ceramic Ion', 46990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806453661-cepillo-secador-modelador-gama-glamour-pink-ceramic-ion-_JM', 'http://http2.mlstatic.com/D_716827-MLA99452399418_112025-I.jpg', 'MLC178456', '2025-12-30T12:35:47.874Z'::timestamptz, '2026-01-21T16:44:32.048Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806388749', 'IQQL88723', 'Aceite Capilar Marula Reparador Hidratante 100ml Serum', 16890, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806388749-aceite-capilar-marula-reparador-hidratante-100ml-serum-_JM', 'http://http2.mlstatic.com/D_715296-MLA99821523703_112025-I.jpg', 'MLC1266', '2025-12-30T12:37:43.508Z'::timestamptz, '2026-01-31T03:17:28.512Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806388845', 'YKHD92469', 'Back Bar Shampoo Revitalizing N°4 Natural Herbs 1000ml Detox', 10751, 15, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806388845-back-bar-shampoo-revitalizing-n4-natural-herbs-1000ml-detox-_JM', 'http://http2.mlstatic.com/D_849615-MLA104252768800_012026-I.jpg', 'MLC8163', '2025-12-30T12:48:41.458Z'::timestamptz, '2026-02-05T03:34:13.717Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806479569', 'POIT23154', 'Omniplex® Decolorante 500grs Farmavita Tono Azul Azul', 18667, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806479569-omniplex-decolorante-500grs-farmavita-tono-azul-azul-_JM', 'http://http2.mlstatic.com/D_985442-MLA99958500295_112025-I.jpg', 'MLC174669', '2025-12-30T12:27:21.339Z'::timestamptz, '2026-01-22T21:14:28.191Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806401747', 'CYQM23183', 'Cepillo Secador Modelador Gama Glamour Pink Ceramic Ion', 46990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806401747-cepillo-secador-modelador-gama-glamour-pink-ceramic-ion-_JM', 'http://http2.mlstatic.com/D_716827-MLA99452399418_112025-I.jpg', 'MLC178456', '2025-12-30T12:35:47.280Z'::timestamptz, '2026-01-21T16:44:29.159Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806427547', 'POIT23154', 'Omniplex® Decolorante 500grs Farmavita Tono Azul', 18667, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806427547-omniplex-decolorante-500grs-farmavita-tono-azul-_JM', 'http://http2.mlstatic.com/D_985442-MLA99958500295_112025-I.jpg', 'MLC174669', '2025-12-30T12:27:21.915Z'::timestamptz, '2026-01-22T21:14:28.181Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806466647', 'WOPV23112', 'Farmavita Amethyste Hydrate Máscara 1000ml', 24890, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1806466647-farmavita-amethyste-hydrate-mascara-1000ml-_JM', 'http://http2.mlstatic.com/D_643526-MLA99446846486_112025-I.jpg', 'MLC1266', '2025-12-30T12:32:45.428Z'::timestamptz, '2026-01-21T16:44:23.141Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806401767', 'COSZ23290', 'Acondicionador Aceite Aguacate 1l Nutre Hidrata Cabello Pelo', 13200, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806401767-acondicionador-aceite-aguacate-1l-nutre-hidrata-cabello-pelo-_JM', 'http://http2.mlstatic.com/D_910076-MLA104804094785_012026-I.jpg', 'MLC418404', '2025-12-30T12:38:51.425Z'::timestamptz, '2026-02-05T17:35:20.876Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806505701', 'IQQL88723', 'Aceite Capilar Marula Reparador Hidratante 100ml Serum', 16890, 5, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806505701-aceite-capilar-marula-reparador-hidratante-100ml-serum-_JM', 'http://http2.mlstatic.com/D_627568-MLA104321497000_012026-I.jpg', 'MLC1266', '2025-12-30T12:37:42.916Z'::timestamptz, '2026-01-31T03:17:28.500Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806506199', 'XZNN23889', 'Secador De Pelo Ga.ma Italymicro Glitt Diamond Titan Keratin Gris', 24108, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806506199-secador-de-pelo-gama-italymicro-glitt-diamond-titan-keratin-gris-_JM', 'http://http2.mlstatic.com/D_834796-MLA99505398024_112025-I.jpg', 'MLC4597', '2025-12-30T13:04:30.466Z'::timestamptz, '2026-01-31T19:46:01.558Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806427775', 'MAQY23288', 'Sow Eco-recarga Shampoo Cabello Seco Y Dañado 1000ml', 29989, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806427775-sow-eco-recarga-shampoo-cabello-seco-y-danado-1000ml-_JM', 'http://http2.mlstatic.com/D_988008-MLA99921467483_112025-I.jpg', 'MLC8163', '2025-12-30T12:47:48.188Z'::timestamptz, '2026-02-03T12:56:47.908Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806427521', 'JZCW22322', 'Plancha De Cabello Ga.ma Italy Elegance Aqua App2205 Celeste Celeste', 32292, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806427521-plancha-de-cabello-gama-italy-elegance-aqua-app2205-celeste-celeste-_JM', 'http://http2.mlstatic.com/D_992324-MLA96108218773_102025-I.jpg', 'MLC178457', '2025-12-30T12:26:13.536Z'::timestamptz, '2026-01-21T16:44:16.351Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806440785', 'SEBO24027', 'Depiladora De Pinzas Gama Essential Apta Para Todo El Cuerpo Color Rosa', 34990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806440785-depiladora-de-pinzas-gama-essential-apta-para-todo-el-cuerpo-color-rosa-_JM', 'http://http2.mlstatic.com/D_918732-MLA84539794934_052025-I.jpg', 'MLC178733', '2025-12-30T12:45:28.598Z'::timestamptz, '2026-01-24T11:18:13.835Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806454101', 'VZCF23344', 'Super Difusor Universal Gama Salon Exclusive Premium Negro', 19990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1806454101-super-difusor-universal-gama-salon-exclusive-premium-negro-_JM', 'http://http2.mlstatic.com/D_809141-MLC104255118398_012026-I.jpg', 'MLC417260', '2025-12-30T13:00:45.782Z'::timestamptz, '2026-01-21T16:44:29.127Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806466721', 'TGMU22670', 'Afeitadora Rasuradora Gama Eggo Corporal Usb Masculina Negro', 26500, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806466721-afeitadora-rasuradora-gama-eggo-corporal-usb-masculina-negro-_JM', 'http://http2.mlstatic.com/D_764968-MLA96321395105_102025-I.jpg', 'MLC431603', '2025-12-30T12:41:13.793Z'::timestamptz, '2026-02-02T20:58:27.309Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806401605', 'OUDY23843', 'Tensiometro De Brazo Bp 1307 Gama Presión Arterial Lcd 3.2 Azul Marino', 23990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806401605-tensiometro-de-brazo-bp-1307-gama-presion-arterial-lcd-32-azul-marino-_JM', 'http://http2.mlstatic.com/D_672479-MLA47778530470_102021-I.jpg', 'MLC180956', '2025-12-30T12:25:03.661Z'::timestamptz, '2026-02-03T21:32:21.125Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806423483', 'CTJT22810', 'Sow Vitamin Hair Shampoo Nutritivo Cabello Seco Y Dañado 1l', 37990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806423483-sow-vitamin-hair-shampoo-nutritivo-cabello-seco-y-danado-1l-_JM', 'http://http2.mlstatic.com/D_906643-MLA100169285477_122025-I.jpg', 'MLC8163', '2025-12-30T20:11:12.711Z'::timestamptz, '2026-01-29T15:20:09.212Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806323981', 'MAQY23288', 'Sow Eco-recarga Shampoo Cabello Seco Y Dañado 1000ml', 29989, 18, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806323981-sow-eco-recarga-shampoo-cabello-seco-y-danado-1000ml-_JM', 'http://http2.mlstatic.com/D_916100-MLA104253073532_012026-I.jpg', 'MLC8163', '2025-12-30T12:47:47.627Z'::timestamptz, '2026-02-03T12:56:49.468Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1809872751', 'ZLKG24321', 'Ga.ma Secador De Cabello Profesional Bravo X8 2400w Negro Negro', 66990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1809872751-gama-secador-de-cabello-profesional-bravo-x8-2400w-negro-negro-_JM', 'http://http2.mlstatic.com/D_990540-MLA99926588779_112025-I.jpg', 'MLC4597', '2026-01-02T18:51:31.317Z'::timestamptz, '2026-01-21T16:44:30.591Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806349689', 'ZIYP23411', 'Secador De Pelo Ga.ma Italy Diva 3d Therapy Negro', 28990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806349689-secador-de-pelo-gama-italy-diva-3d-therapy-negro-_JM', 'http://http2.mlstatic.com/D_799766-MLA99849255757_112025-I.jpg', 'MLC4597', '2025-12-30T12:28:34.959Z'::timestamptz, '2026-02-05T15:27:31.090Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806324033', 'KTAT89837', 'Secador De Pelo Gama Bora Coco Y Almendra Active Ion Oil Blanco', 25830, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806324033-secador-de-pelo-gama-bora-coco-y-almendra-active-ion-oil-blanco-_JM', 'http://http2.mlstatic.com/D_891952-MLA99454435696_112025-I.jpg', 'MLC4597', '2025-12-30T12:51:02.947Z'::timestamptz, '2026-02-02T15:13:25.264Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806349659', 'JZCW22322', 'Plancha De Cabello Ga.ma Italy Elegance Aqua App2205 Celeste', 32292, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806349659-plancha-de-cabello-gama-italy-elegance-aqua-app2205-celeste-_JM', 'http://http2.mlstatic.com/D_859717-MLA103830626095_012026-I.jpg', 'MLC178457', '2025-12-30T12:26:14.119Z'::timestamptz, '2026-01-21T16:34:08.563Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1809782161', 'ALEE24321', 'Plancha De Cabello Ga.ma Italy Elegance Bella Shine Ceramic Ion Negra', 19600, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1809782161-plancha-de-cabello-gama-italy-elegance-bella-shine-ceramic-ion-negra-_JM', 'http://http2.mlstatic.com/D_837382-MLA99473154376_112025-I.jpg', 'MLC178457', '2026-01-02T19:08:21.751Z'::timestamptz, '2026-01-22T23:37:13.631Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3482259320', 'ALEE24321', 'Plancha De Cabello Ga.ma Italy Elegance Bella Shine Ceramic Negro', 19600, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3482259320-plancha-de-cabello-gama-italy-elegance-bella-shine-ceramic-negro-_JM', 'http://http2.mlstatic.com/D_837382-MLA99473154376_112025-I.jpg', 'MLC178457', '2026-01-02T19:08:21.155Z'::timestamptz, '2026-01-22T23:37:13.629Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806323805', 'ZIYP23411', 'Secador De Pelo Ga.ma Italy Diva 3d Therapy Negro Negro', 28990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806323805-secador-de-pelo-gama-italy-diva-3d-therapy-negro-negro-_JM', 'http://http2.mlstatic.com/D_799766-MLA99849255757_112025-I.jpg', 'MLC4597', '2025-12-30T12:28:34.388Z'::timestamptz, '2026-02-05T15:27:31.068Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806272057', 'WOPV23112', 'Farmavita Amethyste Hydrate Máscara 1000ml', 24890, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1806272057-farmavita-amethyste-hydrate-mascara-1000ml-_JM', 'http://http2.mlstatic.com/D_643526-MLA99446846486_112025-I.jpg', 'MLC1266', '2025-12-30T12:32:46.015Z'::timestamptz, '2026-01-21T16:44:26.413Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806319707', 'JNNO23986', 'Sow Vitamin Hair Máscara Cabello Seco Y Dañado 250ml', 24207, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806319707-sow-vitamin-hair-mascara-cabello-seco-y-danado-250ml-_JM', 'http://http2.mlstatic.com/D_827933-MLC104253890802_012026-I.jpg', 'MLC1266', '2025-12-30T20:30:08.366Z'::timestamptz, '2026-02-05T23:20:57.233Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806323767', 'OUDY23843', 'Tensiometro De Brazo Bp 1307 Gama Presión Arterial Lcd 3.2 Negro-estrella', 23990, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806323767-tensiometro-de-brazo-bp-1307-gama-presion-arterial-lcd-32-negro-estrella-_JM', 'http://http2.mlstatic.com/D_672479-MLA47778530470_102021-I.jpg', 'MLC180956', '2025-12-30T12:25:03.088Z'::timestamptz, '2026-02-03T21:32:21.108Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806310141', 'EAMU22950', 'Kuna Puffs Pack 4u - Galletas Saludables Bebés Mix 4 Sabores', 2609, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806310141-kuna-puffs-pack-4u-galletas-saludables-bebes-mix-4-sabores-_JM', 'http://http2.mlstatic.com/D_716439-MLA96782817518_112025-I.jpg', 'MLC418440', '2025-12-30T11:39:24.284Z'::timestamptz, '2026-02-05T13:56:57.620Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806358209', 'UVGJ90808', 'Sow Vitamin Hair Acondicionador Nutritivo Cabello Seco 1l', 36975, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806358209-sow-vitamin-hair-acondicionador-nutritivo-cabello-seco-1l-_JM', 'http://http2.mlstatic.com/D_649156-MLA99422682278_112025-I.jpg', 'MLC418404', '2025-12-30T20:10:08.725Z'::timestamptz, '2026-02-02T14:22:07.420Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806388697', 'WVIV91185', 'Afeitadora Gama Gsh987 Sport Usb Apta Para Ducha Inalámbrica Color Blanco Con Azul Y Negro', 46590, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806388697-afeitadora-gama-gsh987-sport-usb-apta-para-ducha-inalambrica-color-blanco-con-azul-y-negro-_JM', 'http://http2.mlstatic.com/D_606042-MLA99402762046_112025-I.jpg', 'MLC431603', '2025-12-30T12:33:51.839Z'::timestamptz, '2026-01-21T16:34:14.419Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806345111', 'UVGJ90808', 'Sow Vitamin Hair Acondicionador Nutritivo Cabello Seco 1l', 36975, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806345111-sow-vitamin-hair-acondicionador-nutritivo-cabello-seco-1l-_JM', 'http://http2.mlstatic.com/D_649156-MLA99422682278_112025-I.jpg', 'MLC418404', '2025-12-30T20:10:08.180Z'::timestamptz, '2026-02-02T14:22:07.401Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1809756315', 'ZLKG24321', 'Ga.ma Secador De Cabello Profesional Bravo X8 2400w Negro', 66990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1809756315-gama-secador-de-cabello-profesional-bravo-x8-2400w-negro-_JM', 'http://http2.mlstatic.com/D_990540-MLA99926588779_112025-I.jpg', 'MLC4597', '2026-01-02T18:51:31.881Z'::timestamptz, '2026-01-21T16:34:17.530Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806349107', 'EAMU22950', 'Kuna Puffs Pack 4u - Galletas Saludables Para Bebés - Mix 4 Sabores', 2609, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806349107-kuna-puffs-pack-4u-galletas-saludables-para-bebes-mix-4-sabores-_JM', 'http://http2.mlstatic.com/D_716439-MLA96782817518_112025-I.jpg', 'MLC418440', '2025-12-30T11:39:24.930Z'::timestamptz, '2026-02-05T13:56:57.616Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806306401', 'CTJT22810', 'Sow Vitamin Hair Shampoo Nutritivo Cabello Seco Y Dañado 1l', 37990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806306401-sow-vitamin-hair-shampoo-nutritivo-cabello-seco-y-danado-1l-_JM', 'http://http2.mlstatic.com/D_906643-MLA100169285477_122025-I.jpg', 'MLC8163', '2025-12-30T20:11:12.171Z'::timestamptz, '2026-01-29T15:20:09.208Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806362801', 'SEBO24027', 'Depiladora De Pinzas Gama Essential Apta Para Todo El Cuerpo Rosa', 34990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806362801-depiladora-de-pinzas-gama-essential-apta-para-todo-el-cuerpo-rosa-_JM', 'http://http2.mlstatic.com/D_918732-MLA84539794934_052025-I.jpg', 'MLC178733', '2025-12-30T12:45:28.069Z'::timestamptz, '2026-01-21T16:44:29.574Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1806336971', 'KTAT89837', 'Secador De Pelo Gama Bora Coco Y Almendra Active Ion Oil', 25830, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1806336971-secador-de-pelo-gama-bora-coco-y-almendra-active-ion-oil-_JM', 'http://http2.mlstatic.com/D_891952-MLA99454435696_112025-I.jpg', 'MLC4597', '2025-12-30T12:51:03.483Z'::timestamptz, '2026-02-02T15:13:25.243Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1813660911', NULL, 'Hervidor Thomas Th-4343n Negro', 16990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1813660911-hervidor-thomas-th-4343n-negro-_JM', 'http://http2.mlstatic.com/D_972877-MLA101295715960_122025-I.jpg', 'MLC162504', '2026-01-06T12:58:09.208Z'::timestamptz, '2026-02-03T21:09:38.460Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489924754', 'KJAU25747', 'Soporte Celular Cargador Auto Compatible Magsafe iPhone', 19990, 44, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489924754-soporte-celular-cargador-auto-compatible-magsafe-iphone-_JM', 'http://http2.mlstatic.com/D_729085-MLA101460705053_122025-I.jpg', 'MLC58500', '2026-01-05T19:29:24.657Z'::timestamptz, '2026-02-05T20:10:59.249Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489962864', 'TBLI23889', 'Audifonos Hoco Ew46 Tws In Ear Bluetooth Dodge Cat Color Azul', 11390, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489962864-audifonos-hoco-ew46-tws-in-ear-bluetooth-dodge-cat-color-azul-_JM', 'http://http2.mlstatic.com/D_983808-MLA99565692474_122025-I.jpg', 'MLC3697', '2026-01-05T18:32:17.884Z'::timestamptz, '2026-01-21T16:34:10.996Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1812570153', 'YFLE25019', 'Mouse Inalambrico Logitech M190 Blue Full Size Color Azul', 12608, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1812570153-mouse-inalambrico-logitech-m190-blue-full-size-color-azul-_JM', 'http://http2.mlstatic.com/D_882093-MLA96883968619_102025-I.jpg', 'MLC1714', '2026-01-05T17:22:54.846Z'::timestamptz, '2026-01-26T13:03:40.066Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3491177530', 'QPLW24299', 'Mouse Inalambrico Logitech M190 Gris Full Size', 12982, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3491177530-mouse-inalambrico-logitech-m190-gris-full-size-_JM', 'http://http2.mlstatic.com/D_690176-MLA99931778117_112025-I.jpg', 'MLC1714', '2026-01-05T18:29:41.955Z'::timestamptz, '2026-02-04T18:08:21.530Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489651856', 'KJAU25747', 'Soporte Celular Cargador Auto Compatible Magsafe iPhone Negro', 19990, 44, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489651856-soporte-celular-cargador-auto-compatible-magsafe-iphone-negro-_JM', 'http://http2.mlstatic.com/D_729085-MLA101460705053_122025-I.jpg', 'MLC58500', '2026-01-05T19:29:24.060Z'::timestamptz, '2026-02-05T20:10:59.249Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489924490', 'UMOI23550', 'Audifonos Hoco Ew45 In Ear Bluetooth Tws Caramel Cat Caramel Caramelo', 10790, 24, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489924490-audifonos-hoco-ew45-in-ear-bluetooth-tws-caramel-cat-caramel-caramelo-_JM', 'http://http2.mlstatic.com/D_964402-MLA99972881535_112025-I.jpg', 'MLC3697', '2026-01-05T19:03:07.263Z'::timestamptz, '2026-01-30T19:20:11.709Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3490065768', 'YBLK25144', 'Mouse Inalambrico Logitech M190 Rojo Full Size', 12490, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3490065768-mouse-inalambrico-logitech-m190-rojo-full-size-_JM', 'http://http2.mlstatic.com/D_826462-MLA99936008345_112025-I.jpg', 'MLC1714', '2026-01-05T18:30:51.307Z'::timestamptz, '2026-01-28T04:56:11.117Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489443730', 'EAJZ24688', 'Audífonos Bluetooth Es65 Hoco Compatible Apple Samsung 30h Negro', 9070, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489443730-audifonos-bluetooth-es65-hoco-compatible-apple-samsung-30h-negro-_JM', 'http://http2.mlstatic.com/D_817026-MLA99608294408_122025-I.jpg', 'MLC5542', '2026-01-05T17:25:47.350Z'::timestamptz, '2026-02-05T15:19:41.173Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3490631992', 'UCKV91570', 'Audifonos Bluetooth Marca Hoco Modelo W35 Air Triumph Over Ear Verde', 13490, 13, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3490631992-audifonos-bluetooth-marca-hoco-modelo-w35-air-triumph-over-ear-verde-_JM', 'http://http2.mlstatic.com/D_921884-MLA99904948363_112025-I.jpg', 'MLC5542', '2026-01-05T17:24:06.579Z'::timestamptz, '2026-02-05T04:19:39.727Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489470260', 'TBLI23889', 'Audifonos Hoco Ew46 Tws In Ear Bluetooth Dodge Cat Azul Celeste', 11390, 14, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489470260-audifonos-hoco-ew46-tws-in-ear-bluetooth-dodge-cat-azul-celeste-_JM', 'http://http2.mlstatic.com/D_983808-MLA99565692474_122025-I.jpg', 'MLC3697', '2026-01-05T18:32:17.275Z'::timestamptz, '2026-01-21T16:34:08.995Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489560404', 'XALA24724', 'Power Bank Ultra Slim J115 Hoco 5000 Mah Usb Calidad Premium Blanco', 7990, 28, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489560404-power-bank-ultra-slim-j115-hoco-5000-mah-usb-calidad-premium-blanco-_JM', 'http://http2.mlstatic.com/D_970051-MLA99993427871_112025-I.jpg', 'MLC159239', '2026-01-05T17:28:23.701Z'::timestamptz, '2026-02-06T01:12:20.577Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489637796', 'UCKV91570', 'Audifonos Bluetooth Marca Hoco Modelo W35 Air Triumph Over Verde', 13490, 13, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489637796-audifonos-bluetooth-marca-hoco-modelo-w35-air-triumph-over-verde-_JM', 'http://http2.mlstatic.com/D_921884-MLA99904948363_112025-I.jpg', 'MLC5542', '2026-01-05T17:24:05.950Z'::timestamptz, '2026-02-05T04:19:39.737Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3490001140', 'XALA24724', 'Power Bank Ultra Slim J115 Hoco 5000 Mah Usb Calidad Premium Color Blanco', 7990, 28, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3490001140-power-bank-ultra-slim-j115-hoco-5000-mah-usb-calidad-premium-color-blanco-_JM', 'http://http2.mlstatic.com/D_970051-MLA99993427871_112025-I.jpg', 'MLC159239', '2026-01-05T17:28:24.281Z'::timestamptz, '2026-02-06T01:12:19.146Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489444188', 'QPLW24299', 'Mouse Inalambrico Logitech M190 Gris Full Size Gris Marengo', 12982, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489444188-mouse-inalambrico-logitech-m190-gris-full-size-gris-marengo-_JM', 'http://http2.mlstatic.com/D_690176-MLA99931778117_112025-I.jpg', 'MLC1714', '2026-01-05T18:29:41.352Z'::timestamptz, '2026-02-04T18:08:21.534Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489950516', 'UMOI23550', 'Audifonos Hoco Ew45 In Ear Bluetooth Tws Caramel Cat Color Café', 10790, 24, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489950516-audifonos-hoco-ew45-in-ear-bluetooth-tws-caramel-cat-color-cafe-_JM', 'http://http2.mlstatic.com/D_964402-MLA99972881535_112025-I.jpg', 'MLC3697', '2026-01-05T19:03:07.985Z'::timestamptz, '2026-01-30T19:20:11.711Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3494659862', NULL, 'Hervidor Thomas Th-4343n Negro Negro', 16990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3494659862-hervidor-thomas-th-4343n-negro-negro-_JM', 'http://http2.mlstatic.com/D_972877-MLA101295715960_122025-I.jpg', 'MLC162504', '2026-01-06T12:58:08.665Z'::timestamptz, '2026-02-03T21:09:39.686Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489962420', 'EAJZ24688', 'Audífonos Bluetooth Es65 Hoco Compatible Apple Samsung 30h Color Negro', 9070, 0, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489962420-audifonos-bluetooth-es65-hoco-compatible-apple-samsung-30h-color-negro-_JM', 'http://http2.mlstatic.com/D_817026-MLA99608294408_122025-I.jpg', 'MLC5542', '2026-01-05T17:25:47.966Z'::timestamptz, '2026-02-05T15:19:41.174Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3489560882', 'YBLK25144', 'Mouse Inalambrico Logitech M190 Rojo Full Size Rojo', 12490, 9, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3489560882-mouse-inalambrico-logitech-m190-rojo-full-size-rojo-_JM', 'http://http2.mlstatic.com/D_826462-MLA99936008345_112025-I.jpg', 'MLC1714', '2026-01-05T18:30:50.681Z'::timestamptz, '2026-01-28T04:56:08.718Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3490631972', 'YFLE25019', 'Mouse Inalambrico Logitech M190 Blue Full Size Color Azul Azul', 12608, 8, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3490631972-mouse-inalambrico-logitech-m190-blue-full-size-color-azul-azul-_JM', 'http://http2.mlstatic.com/D_882093-MLA96883968619_102025-I.jpg', 'MLC1714', '2026-01-05T17:22:54.121Z'::timestamptz, '2026-01-21T16:44:26.301Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539776720', 'WUFR32801', 'Secador Gama Salon Pro Diva 4d Turquesa Turquesa', 36810, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539776720-secador-gama-salon-pro-diva-4d-turquesa-turquesa-_JM', 'http://http2.mlstatic.com/D_818160-MLA99969876919_112025-I.jpg', 'MLC4597', '2026-01-23T22:50:01.636Z'::timestamptz, '2026-02-03T05:06:58.832Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539507752', 'XHTX32506', 'Sow Must Hair Booster Regenerador Shock D Keratina 100ml', 16900, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539507752-sow-must-hair-booster-regenerador-shock-d-keratina-100ml-_JM', 'http://http2.mlstatic.com/D_790551-MLA99870247581_112025-I.jpg', 'MLC1266', '2026-01-23T22:31:43.872Z'::timestamptz, '2026-02-03T17:48:57.633Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539612196', 'IOAN33519', 'Cafe Con Guaraná Molido Para Deportistas Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539612196-cafe-con-guarana-molido-para-deportistas-zeo-sport-_JM', 'http://http2.mlstatic.com/D_895805-MLC105122037158_012026-I.jpg', 'MLC178742', '2026-01-24T00:14:41.460Z'::timestamptz, '2026-02-01T14:42:18.054Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539624456', 'MGVY32743', 'Farmavita Tratamiento Omniplex Paso Nro 3 X150ml', 14290, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539624456-farmavita-tratamiento-omniplex-paso-nro-3-x150ml-_JM', 'http://http2.mlstatic.com/D_622614-MLA99910758789_112025-I.jpg', 'MLC1266', '2026-01-23T22:46:07.676Z'::timestamptz, '2026-02-03T07:07:54.451Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539663822', 'BAMM33485', 'Cafe Con Ginseng Molido Para Deportistas Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539663822-cafe-con-ginseng-molido-para-deportistas-zeo-sport-_JM', 'http://http2.mlstatic.com/D_865783-MLC105122035454_012026-I.jpg', 'MLC178742', '2026-01-24T00:10:07.711Z'::timestamptz, '2026-02-05T02:12:56.124Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3537132232', 'OVLY29097', 'Peluche Superzings Serie 4 Algodon Multicolor Al Azar', 16490, 16, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3537132232-peluche-superzings-serie-4-algodon-multicolor-al-azar-_JM', 'http://http2.mlstatic.com/D_821782-MLA104995566202_012026-I.jpg', 'MLC1166', '2026-01-22T15:32:18.363Z'::timestamptz, '2026-02-02T00:44:20.683Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539455930', 'MGVY32743', 'Farmavita Tratamiento Omniplex Paso Nro 3 X150ml', 14290, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539455930-farmavita-tratamiento-omniplex-paso-nro-3-x150ml-_JM', 'http://http2.mlstatic.com/D_622614-MLA99910758789_112025-I.jpg', 'MLC1266', '2026-01-23T22:46:07.123Z'::timestamptz, '2026-02-02T02:30:06.932Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539468922', 'WUFR32801', 'Secador Gama Salon Pro Diva 4d Turquesa', 36810, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539468922-secador-gama-salon-pro-diva-4d-turquesa-_JM', 'http://http2.mlstatic.com/D_818160-MLA99969876919_112025-I.jpg', 'MLC4597', '2026-01-23T22:50:02.290Z'::timestamptz, '2026-02-03T05:06:57.031Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3521239560', 'PKJS00413', 'Soporte Porta Celular 360° De Rejilla Ventilacion Auto Coche Negro', 4200, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3521239560-soporte-porta-celular-360-de-rejilla-ventilacion-auto-coche-negro-_JM', 'http://http2.mlstatic.com/D_768971-MLA101429531741_122025-I.jpg', 'MLC58500', '2026-01-14T22:10:29.410Z'::timestamptz, '2026-02-05T16:02:45.320Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1824465571', 'OVLY29097', 'Peluche Superzings Serie 4 Original Algodon Multicolor Al Azar', 16490, 16, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1824465571-peluche-superzings-serie-4-original-algodon-multicolor-al-azar-_JM', 'http://http2.mlstatic.com/D_857813-MLC104769906115_012026-I.jpg', 'MLC1166', '2026-01-14T13:58:37.884Z'::timestamptz, '2026-02-02T00:44:20.691Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539631454', 'INIR33311', 'Goldenmilk Matcha 80 Gr - Leche Dorada Alma Foods', 9990, 10, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539631454-goldenmilk-matcha-80-gr-leche-dorada-alma-foods-_JM', 'http://http2.mlstatic.com/D_917047-MLC105680663325_012026-I.jpg', 'MLC178668', '2026-01-23T16:02:07.168Z'::timestamptz, '2026-02-03T11:54:43.270Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2943499262', 'AFHP63987', 'Auriculares W35 Max Joy Bt Color Gold Luz Plateado Gold', 13600, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2943499262-auriculares-w35-max-joy-bt-color-gold-luz-plateado-gold-_JM', 'http://http2.mlstatic.com/D_834672-MLA80178798115_102024-I.jpg', 'MLC441017', '2025-06-28T02:59:10.753Z'::timestamptz, '2026-02-05T17:34:46.384Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539663210', 'CDID32339', 'Cepillo Para Brushing Orgánico Extendido 4,4cm - Sow Verde', 10990, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539663210-cepillo-para-brushing-organico-extendido-44cm-sow-verde-_JM', 'http://http2.mlstatic.com/D_877751-MLA101919519517_122025-I.jpg', 'MLC180894', '2026-01-23T22:48:34.293Z'::timestamptz, '2026-02-01T22:27:34.677Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539951358', 'VBJI84190', 'Pack 3 45cm Bandeja Antideslizante Garzon Restaurant Servir Negro', 18990, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539951358-pack-3-45cm-bandeja-antideslizante-garzon-restaurant-servir-negro-_JM', 'http://http2.mlstatic.com/D_748888-MLA105118441752_012026-I.jpg', 'MLC174474', '2026-01-23T21:47:21.387Z'::timestamptz, '2026-01-30T03:01:35.976Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1822200451', 'NLOI27301', 'Alisador Gama Italy Ultra X-wide Digital Iht Premium Negro', 65990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1822200451-alisador-gama-italy-ultra-x-wide-digital-iht-premium-negro-_JM', 'http://http2.mlstatic.com/D_981768-MLC104541832231_012026-I.jpg', 'MLC178457', '2026-01-12T14:53:59.676Z'::timestamptz, '2026-01-21T16:44:22.729Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539547288', 'VYSI33485', 'Cafe Tradicional Arabico Colombiano 100% Molido Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539547288-cafe-tradicional-arabico-colombiano-100-molido-zeo-sport-_JM', 'http://http2.mlstatic.com/D_910180-MLC105122217164_012026-I.jpg', 'MLC178742', '2026-01-24T00:26:53.047Z'::timestamptz, '2026-01-31T13:36:43.789Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539776434', 'PNJC32919', 'Sow Vibrant Hair Máscara Cabello Con Color Y Mechas 250ml', 22990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539776434-sow-vibrant-hair-mascara-cabello-con-color-y-mechas-250ml-_JM', 'http://http2.mlstatic.com/D_825563-MLA99895278461_112025-I.jpg', 'MLC1266', '2026-01-23T22:12:36.184Z'::timestamptz, '2026-02-03T16:53:18.250Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC2942252882', 'AFHP63987', 'Auriculares W35 Max Joy Bt Color Rosado', 13600, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-2942252882-auriculares-w35-max-joy-bt-color-rosado-_JM', 'http://http2.mlstatic.com/D_990591-MLA99519644934_112025-I.jpg', 'MLC441017', '2025-06-28T02:59:11.297Z'::timestamptz, '2026-02-05T17:34:46.379Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539769926', 'LKLY32421', 'Goldenmilk Tradicional 80 G Alma Golden Food - Leche Dorada', 9990, 10, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539769926-goldenmilk-tradicional-80-g-alma-golden-food-leche-dorada-_JM', 'http://http2.mlstatic.com/D_843018-MLC105684090965_012026-I.jpg', 'MLC178668', '2026-01-23T15:34:45.046Z'::timestamptz, '2026-02-03T05:14:03.625Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539663906', 'RRSM98890', 'Cafe Tradicional Arabico Colombiano Grano Entero Zeo Sport', 19990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539663906-cafe-tradicional-arabico-colombiano-grano-entero-zeo-sport-_JM', 'http://http2.mlstatic.com/D_684494-MLC105701118191_012026-I.jpg', 'MLC178742', '2026-01-24T00:22:49.888Z'::timestamptz, '2026-01-31T22:16:58.453Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539416646', 'LVBY32957', 'Cepillo Gama Pulidor Tipo Esqueleto Cerdas Mixtas Negro Negro', 7990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539416646-cepillo-gama-pulidor-tipo-esqueleto-cerdas-mixtas-negro-negro-_JM', 'http://http2.mlstatic.com/D_914490-MLU69363408167_052023-I.jpg', 'MLC180894', '2026-01-23T22:44:21.879Z'::timestamptz, '2026-01-30T16:55:55.810Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539416530', 'XHTX32506', 'Sow Must Hair Booster Regenerador Shock D Keratina 100ml', 16900, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539416530-sow-must-hair-booster-regenerador-shock-d-keratina-100ml-_JM', 'http://http2.mlstatic.com/D_790551-MLA99870247581_112025-I.jpg', 'MLC1266', '2026-01-23T22:31:44.528Z'::timestamptz, '2026-02-03T17:48:57.624Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1846781437', 'BAMM33485', 'Cafe Con Ginseng Molido Para Deportistas Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1846781437-cafe-con-ginseng-molido-para-deportistas-zeo-sport-_JM', 'http://http2.mlstatic.com/D_968848-MLA106348623067_022026-I.jpg', 'MLC178742', '2026-02-01T14:06:12.631Z'::timestamptz, '2026-02-01T14:06:22.772Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3553433476', 'VYSI33485', 'Cafe Tradicional Arabico Colombiano 100% Molido Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3553433476-cafe-tradicional-arabico-colombiano-100-molido-zeo-sport-_JM', 'http://http2.mlstatic.com/D_846101-MLA105703583824_012026-I.jpg', 'MLC178742', '2026-01-31T13:36:42.414Z'::timestamptz, '2026-01-31T13:58:33.594Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1847601515', 'VZCM38412', 'Just For Men Colorante Gel Barba Y Bigote Tapa Canas Negro 1 Negro', 9990, 11, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1847601515-just-for-men-colorante-gel-barba-y-bigote-tapa-canas-negro-1-negro-_JM', 'http://http2.mlstatic.com/D_710166-MLA99502160348_112025-I.jpg', 'MLC174669', '2026-02-02T14:12:26.352Z'::timestamptz, '2026-02-05T00:01:09.653Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539410658', 'XMJQ32665', 'Goldenmilk Cacao 80 Gr - Leche Dorada Alma Foods', 9990, 10, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539410658-goldenmilk-cacao-80-gr-leche-dorada-alma-foods-_JM', 'http://http2.mlstatic.com/D_618082-MLC105103448120_012026-I.jpg', 'MLC178668', '2026-01-23T15:46:51.033Z'::timestamptz, '2026-01-30T16:56:09.040Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1847821041', 'DAKC37933', 'Organyc Toallitas Húmedas Bebé 60 Unidades Hipoalergénicas', 5490, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1847821041-organyc-toallitas-humedas-bebe-60-unidades-hipoalergenicas-_JM', 'http://http2.mlstatic.com/D_710201-MLA99925305419_112025-I.jpg', 'MLC418676', '2026-02-02T14:11:01.645Z'::timestamptz, '2026-02-02T21:29:30.203Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1846607129', 'JDST33162', 'Cafe Dorado Con Curcuma Y Pimienta Negra Molido Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1846607129-cafe-dorado-con-curcuma-y-pimienta-negra-molido-zeo-sport-_JM', 'http://http2.mlstatic.com/D_998779-MLA106345415687_022026-I.jpg', 'MLC178742', '2026-02-01T12:46:02.295Z'::timestamptz, '2026-02-01T12:46:53.866Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1847601133', NULL, 'Protector Diario Organyc Algodón 24 Unid Asborcion Optima', 6190, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1847601133-protector-diario-organyc-algodon-24-unid-asborcion-optima-_JM', 'http://http2.mlstatic.com/D_828106-MLA99852628981_112025-I.jpg', 'MLC409598', '2026-02-02T14:02:42.208Z'::timestamptz, '2026-02-02T14:17:32.001Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1847730391', NULL, 'Protector Diario Organyc Algodón', 6190, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-1847730391-protector-diario-organyc-algodon-_JM', 'http://http2.mlstatic.com/D_828106-MLA99852628981_112025-I.jpg', 'MLC409598', '2026-02-02T14:02:42.717Z'::timestamptz, '2026-02-04T16:27:03.049Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1846619307', 'IOAN33519', 'Cafe Con Guaraná Molido Para Deportistas Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1846619307-cafe-con-guarana-molido-para-deportistas-zeo-sport-_JM', 'http://http2.mlstatic.com/D_776858-MLA106344850423_022026-I.jpg', 'MLC178742', '2026-02-01T12:25:21.757Z'::timestamptz, '2026-02-01T12:25:32.015Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1838604399', 'JSPD30748', 'Libros Para Colorear, De Manoj, Vol. 1. Editorial Manoj Publications, Tapa Blanda (2025)', 24988, 7, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1838604399-libros-para-colorear-de-manoj-vol-1-editorial-manoj-publications-tapa-blanda-2025-_JM', 'http://http2.mlstatic.com/D_643341-MLA105768204429_012026-I.jpg', 'MLC1196', '2026-01-24T22:32:48.538Z'::timestamptz, '2026-01-30T15:19:27.211Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539352224', 'CDID32339', 'Cepillo Para Brushing Orgánico Extendido 4,4cm - Sow Verde Verde', 10990, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539352224-cepillo-para-brushing-organico-extendido-44cm-sow-verde-verde-_JM', 'http://http2.mlstatic.com/D_877751-MLA101919519517_122025-I.jpg', 'MLC180894', '2026-01-23T22:48:33.712Z'::timestamptz, '2026-02-03T07:54:39.730Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1837360681', 'YRXY20666', 'Pack 10 Sobres Twopack (2 Figuras) Superzings Serie 4', 18990, 11, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1837360681-pack-10-sobres-twopack-2-figuras-superzings-serie-4-_JM', 'http://http2.mlstatic.com/D_930948-MLA105118489942_012026-I.jpg', 'MLC3422', '2026-01-23T21:14:34.567Z'::timestamptz, '2026-02-04T12:45:57.091Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539430314', 'JDST33162', 'Cafe Dorado Con Curcuma Y Pimienta Negra Molido Zeo Sport', 19990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539430314-cafe-dorado-con-curcuma-y-pimienta-negra-molido-zeo-sport-_JM', 'http://http2.mlstatic.com/D_740678-MLC105121890374_012026-I.jpg', 'MLC178742', '2026-01-24T00:18:15.205Z'::timestamptz, '2026-02-05T02:49:16.110Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3541823874', 'WKSZ40212', 'Set 10 9x9cm Alfombra Infantil Goma Eva Cuadros Bebes Niños Multicolor Números', 3000, 3, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3541823874-set-10-9x9cm-alfombra-infantil-goma-eva-cuadros-bebes-ninos-multicolor-numeros-_JM', 'http://http2.mlstatic.com/D_613554-MLA105239494584_012026-I.jpg', 'MLC439869', '2026-01-25T23:51:17.025Z'::timestamptz, '2026-02-03T15:51:39.387Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539455922', 'LVBY32957', 'Cepillo Gama Pulidor Tipo Esqueleto Cerdas Mixtas Negro', 7990, 6, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539455922-cepillo-gama-pulidor-tipo-esqueleto-cerdas-mixtas-negro-_JM', 'http://http2.mlstatic.com/D_914490-MLU69363408167_052023-I.jpg', 'MLC180894', '2026-01-23T22:44:22.393Z'::timestamptz, '2026-02-04T17:49:03.104Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3539377954', 'PNJC32919', 'Sow Vibrant Hair Máscara Cabello Con Color Y Mechas 250ml', 22990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-3539377954-sow-vibrant-hair-mascara-cabello-con-color-y-mechas-250ml-_JM', 'http://http2.mlstatic.com/D_825563-MLA99895278461_112025-I.jpg', 'MLC1266', '2026-01-23T22:12:35.631Z'::timestamptz, '2026-01-31T16:18:17.490Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1837374241', 'QBKE89081', 'Goldenmilk Cacao 240 Gr - Leche Dorada Alma Foods', 20990, 2, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1837374241-goldenmilk-cacao-240-gr-leche-dorada-alma-foods-_JM', 'http://http2.mlstatic.com/D_824397-MLA105698486929_012026-I.jpg', 'MLC178668', '2026-01-23T22:11:37.083Z'::timestamptz, '2026-02-05T02:17:46.492Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1846120255', 'RRSM98890', 'Cafe Tradicional Arabico Colombiano Grano Entero Zeo Sport', 19990, 1, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1846120255-cafe-tradicional-arabico-colombiano-grano-entero-zeo-sport-_JM', 'http://http2.mlstatic.com/D_965022-MLA106309381995_012026-I.jpg', 'MLC178742', '2026-01-31T13:26:24.842Z'::timestamptz, '2026-02-01T07:41:15.818Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558016584', NULL, 'Planchita De Pelo Gama Keration X-wide Digital 230ºc Color Dorado', 39990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558016584-planchita-de-pelo-gama-keration-x-wide-digital-230c-color-dorado-_JM', 'http://http2.mlstatic.com/D_899306-MLA81588029689_122024-I.jpg', 'MLC178457', '2026-02-03T12:27:00.467Z'::timestamptz, '2026-02-04T19:08:04.243Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558096824', 'DGBY23014', 'Depiladora Gama Oasis Sensation Usb Uso En Seco Y Húmedo Blanco', 59590, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558096824-depiladora-gama-oasis-sensation-usb-uso-en-seco-y-humedo-blanco-_JM', 'http://http2.mlstatic.com/D_653247-MLA84838809739_052025-I.jpg', 'MLC178733', '2026-02-03T13:40:09.029Z'::timestamptz, '2026-02-04T19:07:39.411Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1847575943', 'DAKC37933', 'Organyc Toallitas Húmedas Bebé 60 Unidades Hipoalergénicas Sin Alcohol', 5490, 12, 'active', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1847575943-organyc-toallitas-humedas-bebe-60-unidades-hipoalergenicas-sin-alcohol-_JM', 'http://http2.mlstatic.com/D_710201-MLA99925305419_112025-I.jpg', 'MLC418676', '2026-02-02T14:11:02.163Z'::timestamptz, '2026-02-03T14:08:32.404Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558187356', NULL, 'Depiladora Eléctrica Braun Silk-épil 3, 3-031 Color Blanco', 69990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558187356-depiladora-electrica-braun-silk-epil-3-3-031-color-blanco-_JM', 'http://http2.mlstatic.com/D_691410-MLA84839463211_052025-I.jpg', 'MLC178733', '2026-02-03T13:41:23.970Z'::timestamptz, '2026-02-04T19:07:36.082Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558031536', NULL, 'Depiladora Eléctrica Braun Silk-épil 3, 3-031 Color Blanco Blanco', 69990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558031536-depiladora-electrica-braun-silk-epil-3-3-031-color-blanco-blanco-_JM', 'http://http2.mlstatic.com/D_691410-MLA84839463211_052025-I.jpg', 'MLC178733', '2026-02-03T13:41:23.452Z'::timestamptz, '2026-02-04T19:07:36.094Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558016638', NULL, 'Gama Afeitadora Femenina Tiny Go Usb Negro Blanco', 49990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558016638-gama-afeitadora-femenina-tiny-go-usb-negro-blanco-_JM', 'http://http2.mlstatic.com/D_860766-MLA99542104904_122025-I.jpg', 'MLC431603', '2026-02-03T12:27:58.345Z'::timestamptz, '2026-02-04T19:07:59.650Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558044818', NULL, 'Secador De Pelo Gama Diamond Ceramic 2300w Nano Silver Blanc Blanco', 27388, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558044818-secador-de-pelo-gama-diamond-ceramic-2300w-nano-silver-blanc-blanco-_JM', 'http://http2.mlstatic.com/D_919867-MLA100066869535_122025-I.jpg', 'MLC4597', '2026-02-03T13:37:10.080Z'::timestamptz, '2026-02-04T19:07:50.809Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558109356', NULL, 'Secador De Pelo Gama Bora 3d Therapy Ion Keration 2200 Watts Color Rosa', 28590, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558109356-secador-de-pelo-gama-bora-3d-therapy-ion-keration-2200-watts-color-rosa-_JM', 'http://http2.mlstatic.com/D_936719-MLA99520606058_112025-I.jpg', 'MLC4597', '2026-02-03T13:38:09.158Z'::timestamptz, '2026-02-04T19:07:47.791Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558109390', 'DGBY23014', 'Depiladora Gama Oasis Sensation Usb Uso En Seco Y Húmedo Color Blanco', 59590, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558109390-depiladora-gama-oasis-sensation-usb-uso-en-seco-y-humedo-color-blanco-_JM', 'http://http2.mlstatic.com/D_653247-MLA84838809739_052025-I.jpg', 'MLC178733', '2026-02-03T13:40:09.722Z'::timestamptz, '2026-02-04T19:07:39.397Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558070418', 'HCZE22881', 'Secador Gama Eolic Travel Ion Turmalina Plegable Compacto Color Negro', 12540, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558070418-secador-gama-eolic-travel-ion-turmalina-plegable-compacto-color-negro-_JM', 'http://http2.mlstatic.com/D_878226-MLA99531230972_122025-I.jpg', 'MLC4597', '2026-02-03T13:38:57.010Z'::timestamptz, '2026-02-04T19:07:42.544Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558083546', NULL, 'Secador De Pelo Gama Mistral Ceramic Ion Nano Silver 2200w Color Negro', 21697, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558083546-secador-de-pelo-gama-mistral-ceramic-ion-nano-silver-2200w-color-negro-_JM', 'http://http2.mlstatic.com/D_915148-MLA100056999801_122025-I.jpg', 'MLC4597', '2026-02-03T13:32:21.573Z'::timestamptz, '2026-02-04T19:07:54.430Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558174518', NULL, 'Ga.ma Italy Innova Extreme Cepillo Alisador Digital 230°c Blanco', 29990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558174518-gama-italy-innova-extreme-cepillo-alisador-digital-230c-blanco-_JM', 'http://http2.mlstatic.com/D_800412-MLA81458558555_122024-I.jpg', 'MLC178456', '2026-02-03T13:44:24.371Z'::timestamptz, '2026-02-04T19:07:27.272Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558044906', NULL, 'Gama Plancha Elegance Avocado Negro Negro Con Verde', 24966, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558044906-gama-plancha-elegance-avocado-negro-negro-con-verde-_JM', 'http://http2.mlstatic.com/D_776183-MLA99421490404_112025-I.jpg', 'MLC178457', '2026-02-03T13:42:31.629Z'::timestamptz, '2026-02-04T19:07:30.656Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558055556', NULL, 'Cortapelos Clipper Gama Gm 562 Magnético 13 Piezas Azul Azul', 14990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558055556-cortapelos-clipper-gama-gm-562-magnetico-13-piezas-azul-azul-_JM', 'http://http2.mlstatic.com/D_818686-MLA99452953684_112025-I.jpg', 'MLC5411', '2026-02-03T12:26:05.840Z'::timestamptz, '2026-02-04T19:08:07.644Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC1847576007', 'VZCM38412', 'Just For Men Colorante Gel Barba Y Bigote Tapa Canas Negro', 9990, 11, 'paused', 'fulfillment', 'https://articulo.mercadolibre.cl/MLC-1847576007-just-for-men-colorante-gel-barba-y-bigote-tapa-canas-negro-_JM', 'http://http2.mlstatic.com/D_710166-MLA99502160348_112025-I.jpg', 'MLC174669', '2026-02-02T14:12:26.923Z'::timestamptz, '2026-02-03T12:46:22.480Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558148692', NULL, 'Ga.ma Italy Innova Extreme Cepillo Alisador Digital 230°c Ion Plus', 29990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558148692-gama-italy-innova-extreme-cepillo-alisador-digital-230c-ion-plus-_JM', 'http://http2.mlstatic.com/D_800412-MLA81458558555_122024-I.jpg', 'MLC178456', '2026-02-03T13:44:24.934Z'::timestamptz, '2026-02-04T19:07:27.258Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558161662', NULL, 'Secador De Pelo Gama Mistral Ceramic Ion Nano Silver 2200w Negro', 21697, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558161662-secador-de-pelo-gama-mistral-ceramic-ion-nano-silver-2200w-negro-_JM', 'http://http2.mlstatic.com/D_915148-MLA100056999801_122025-I.jpg', 'MLC4597', '2026-02-03T13:32:20.985Z'::timestamptz, '2026-02-04T19:07:54.445Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558042600', NULL, 'Cortapelos Clipper Gama Gm 562 Magnético 13 Piezas Color Azul', 14990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558042600-cortapelos-clipper-gama-gm-562-magnetico-13-piezas-color-azul-_JM', 'http://http2.mlstatic.com/D_818686-MLA99452953684_112025-I.jpg', 'MLC5411', '2026-02-03T12:26:06.452Z'::timestamptz, '2026-02-04T19:08:07.625Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558135838', NULL, 'Gama Rizador Tourmaline Avocado 25mm Negro', 22990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558135838-gama-rizador-tourmaline-avocado-25mm-negro-_JM', 'http://http2.mlstatic.com/D_652568-MLU69370775633_052023-I.jpg', 'MLC43660', '2026-02-03T13:47:21.492Z'::timestamptz, '2026-02-04T19:22:15.000Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558083650', NULL, 'Secador De Pelo Gama Diamond Ceramic 2300w Nano Silver Color Blanco', 27388, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558083650-secador-de-pelo-gama-diamond-ceramic-2300w-nano-silver-color-blanco-_JM', 'http://http2.mlstatic.com/D_919867-MLA100066869535_122025-I.jpg', 'MLC4597', '2026-02-03T13:37:10.681Z'::timestamptz, '2026-02-04T19:07:50.792Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3558005870', NULL, 'Secador De Pelo Gama Bora 3d Therapy Ion Keration 2200 Watts Rosa', 28590, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3558005870-secador-de-pelo-gama-bora-3d-therapy-ion-keration-2200-watts-rosa-_JM', 'http://http2.mlstatic.com/D_936719-MLA99520606058_112025-I.jpg', 'MLC4597', '2026-02-03T13:38:08.557Z'::timestamptz, '2026-02-04T19:07:47.805Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3560153616', 'TNFQ38355', 'Creatina Monohidratada Micronizada Zeo Sport 150g Sin Sabor Vegana', 10292, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3560153616-creatina-monohidratada-micronizada-zeo-sport-150g-sin-sabor-vegana-_JM', 'http://http2.mlstatic.com/D_790427-MLA99521862786_122025-I.jpg', 'MLC435304', '2026-02-04T13:47:31.556Z'::timestamptz, '2026-02-04T14:26:57.255Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3557967014', NULL, 'Gama Rizador Tourmaline Avocado 25mm Negro', 22990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3557967014-gama-rizador-tourmaline-avocado-25mm-negro-_JM', 'http://http2.mlstatic.com/D_652568-MLU69370775633_052023-I.jpg', 'MLC43660', '2026-02-03T13:47:20.930Z'::timestamptz, '2026-02-04T19:07:22.353Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3560153612', 'TNFQ38355', 'Creatina Monohidratada Micronizada Zeo Sport 150g Vegana Sin Sabor', 10292, 1, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3560153612-creatina-monohidratada-micronizada-zeo-sport-150g-vegana-sin-sabor-_JM', 'http://http2.mlstatic.com/D_790427-MLA99521862786_122025-I.jpg', 'MLC435304', '2026-02-04T13:47:30.942Z'::timestamptz, '2026-02-06T01:14:11.074Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3557928026', NULL, 'Gama Plancha Elegance Avocado Negro', 24966, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3557928026-gama-plancha-elegance-avocado-negro-_JM', 'http://http2.mlstatic.com/D_776183-MLA99421490404_112025-I.jpg', 'MLC178457', '2026-02-03T13:42:32.247Z'::timestamptz, '2026-02-04T19:07:30.636Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3557938774', NULL, 'Planchita De Pelo Gama Keration X-wide Digital 230oc Dorado Dorado', 39990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3557938774-planchita-de-pelo-gama-keration-x-wide-digital-230oc-dorado-dorado-_JM', 'http://http2.mlstatic.com/D_899306-MLA81588029689_122024-I.jpg', 'MLC178457', '2026-02-03T12:26:59.905Z'::timestamptz, '2026-02-04T19:29:53.400Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3557966854', 'HCZE22881', 'Secador Gama Eolic Travel Ion Turmalina Plegable Compacto Negro', 12540, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3557966854-secador-gama-eolic-travel-ion-turmalina-plegable-compacto-negro-_JM', 'http://http2.mlstatic.com/D_878226-MLA99531230972_122025-I.jpg', 'MLC4597', '2026-02-03T13:38:56.269Z'::timestamptz, '2026-02-04T19:07:42.559Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES ('MLC3557912974', NULL, 'Gama Afeitadora Femenina Tiny Go Usb Negro Blanco', 49990, 0, 'paused', 'xd_drop_off', 'https://articulo.mercadolibre.cl/MLC-3557912974-gama-afeitadora-femenina-tiny-go-usb-negro-blanco-_JM', 'http://http2.mlstatic.com/D_860766-MLA99542104904_122025-I.jpg', 'MLC431603', '2026-02-03T12:27:58.983Z'::timestamptz, '2026-02-04T19:07:59.638Z'::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();

