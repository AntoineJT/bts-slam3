DELIMITER |

DROP FUNCTION IF EXISTS affdate;
CREATE FUNCTION affdate(maDate DATE) RETURNS VARCHAR(30)
BEGIN
    DECLARE day_of_week VARCHAR(9) DEFAULT 'Erreur!';
    DECLARE month_name VARCHAR(10) DEFAULT 'Erreur!'; -- change max length

    CASE WEEKDAY(maDate)
        WHEN 0 THEN SET day_of_week = 'Lundi';
        WHEN 1 THEN SET day_of_week = 'Mardi';
        WHEN 2 THEN SET day_of_week = 'Mercredi';
        WHEN 3 THEN SET day_of_week = 'Jeudi';
        WHEN 4 THEN SET day_of_week = 'Vendredi';
        WHEN 5 THEN SET day_of_week = 'Samedi';
        WHEN 6 THEN SET day_of_week = 'Dimanche';
    END CASE;

    CASE MONTH(maDate)
        WHEN 1 THEN SET month_name = 'Janvier';
        WHEN 2 THEN SET month_name = 'Février';
        WHEN 3 THEN SET month_name = 'Mars';
        WHEN 4 THEN SET month_name = 'Avril';
        WHEN 5 THEN SET month_name = 'Mai';
        WHEN 6 THEN SET month_name = 'Juin';
        WHEN 7 THEN SET month_name = 'Juillet';
        WHEN 8 THEN SET month_name = 'Août';
        WHEN 9 THEN SET month_name = 'Septembre';
        WHEN 10 THEN SET month_name = 'Octobre';
        WHEN 11 THEN SET month_name = 'Novembre';
        WHEN 12 THEN SET month_name = 'Décembre';
    END CASE;

    RETURN CONCAT(day_of_week, ' ', DAY(maDate), ' ', month_name, ' ', YEAR(maDate));
END;

|
DELIMITER ;
