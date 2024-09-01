verifier les variables d environnement soient utilisees

---

voir si j utilise 

MARIADB_DATA_PATH=/home/abonnefo/data/mariadb
WORDPRESS_DATA_PATH=/home/abonnefo/data/wordpress

volumes:
  mariadb_data:
    driver: local
    driver_opts:
      type: none
      device: ${MARIADB_DATA_PATH}
      o: bind
  wordpress_data:
    driver: local
    driver_opts:
      type: none
      device: ${WORDPRESS_DATA_PATH}
      o: bind

---

