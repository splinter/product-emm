

DROP TABLE IF EXISTS devices;
CREATE TABLE devices(
	ID INT PRIMARY KEY auto_increment,
	TENANT_ID INT NOT NULL,
	USER_ID VARCHAR(128) NOT NULL,
	PLATFORM_ID INT NOT NULL,
	REG_ID TEXT DEFAULT NULL,
	OS_VERSION VARCHAR(45) DEFAULT NULL,
	PROPERTIES TEXT,
	CREATED_DATE DATETIME DEFAULT NULL,
	STATUS VARCHAR(10) DEFAULT NULL,
	BYOD INT DEFAULT 1,
	DELETED INT DEFAULT 0,
	VENDOR VARCHAR(11) DEFAULT NULL,
	UDID VARCHAR(4096) DEFAULT NULL,
	PUSH_TOKEN VARCHAR(256) DEFAULT NULL,
	MAC VARCHAR(100) DEFAULT NULL
);

DROP TABLE IF EXISTS featuregroup;
CREATE TABLE featuregroup(
	ID INT PRIMARY KEY auto_increment,
	NAME VARCHAR(45) DEFAULT NULL,
	DESCRIPTION VARCHAR(45) DEFAULT NULL
);

INSERT INTO featuregroup VALUES (1,'MDM_OPERATION','Operations'),(2,'MAM','Application'),(3,'MMM','Messaging'),(4,'MDM_CONFIGURATION','Configuration'),(5,'MDM_INFO','Information');


DROP TABLE IF EXISTS features;
CREATE TABLE features(
	ID INT PRIMARY KEY auto_increment,
	NAME VARCHAR(45) DEFAULT NULL,
	CODE VARCHAR(45) DEFAULT NULL,
	DESCRIPTION VARCHAR(45) NOT NULL,
	DELETED INT DEFAULT NULL,
	GROUP_ID INT DEFAULT NULL,
	TYPE_ID INT DEFAULT NULL,
	MONITOR INT DEFAULT 0,
	PERMISSION_TYPE INT DEFAULT 0 
);

INSERT INTO features VALUES (1,'LOCK','503A','Device Lock',0,1,1,0,1),(2,'WIPE','504A','Wipe',0,1,1,0,1),(3,'CLEARPASSCODE','505A','Clear',0,1,1,0,1),(4,'APPLIST','502A','Get All Applications',0,2,2,1,0),(5,'LOCATION','501A','Location',0,1,2,0,0),(6,'INFO','500A','Device Information',0,5,2,1,0),(7,'NOTIFICATION','506A','Message',0,3,1,0,0),(8,'WIFI','507A','Wifi',0,4,1,0,3),(9,'CAMERA','508A','Camera',0,1,1,0,1),(12,'MUTE','513A','Mute Device',0,1,1,0,1),(13,'INSTALLAPP','509A','Install Application',0,2,3,0,0),(14,'UNINSTALLAPP','510A','Uninstall Application',0,2,3,0,0),(15,'ENCRYPT','511A','Encrypt Storage',0,1,1,0,1),(16,'APN','512A','APN',0,4,1,0,3),(21,'WEBCLIP','518A','Create Webclips',0,4,3,0,3),(22,'PASSWORDPOLICY','519A','Passcode Policy',0,4,1,0,3),(23,'EMAIL','520A','Email Configuration',0,4,1,0,3),(24,'GOOGLECALENDAR','521A','Calender Subscription',0,4,1,0,3),(26,'VPN','523A','VPN',0,4,1,0,3),(27,'LDAP','524A','LDAP',0,4,1,0,3),(29,'CHANGEPASSWORD','526A','Set Passcode',0,4,1,0,3),(30,'ENTERPRISEWIPE','527A','Enterprise Wipe',0,1,1,0,1),(31,'POLICY','500P','Policy Enforcement',0,4,2,0,0),(32,'MONITORING','501P','Policy Monitoring ',0,5,2,1,0),(33,'BLACKLISTAPPS','528B','Blacklist Apps',0,2,1,0,0),(34,'REVOKEPOLICY','502P','Revoke Policy',0,4,2,0,0);

DROP TABLE IF EXISTS permissions;
CREATE TABLE permissions(
	ID INT PRIMARY KEY auto_increment,
	ROLE VARCHAR(45) DEFAULT NULL,
	CONTENT TEXT DEFAULT NULL,
	TENANT_ID INT DEFAULT NULL
);

DROP TABLE IF EXISTS featuretype;
CREATE TABLE featuretype(
	ID INT PRIMARY KEY auto_increment,
	NAME VARCHAR(45) DEFAULT NULL,
	DESCRIPTION VARCHAR(45) DEFAULT NULL,
	DELETED INT DEFAULT NULL	
);

INSERT INTO featuretype VALUES (1,'OPERATION','Can do groups, users, devices',0),(2,'INFO','Only for devices',0),(3,'APPLICATION','application related stuff',0);

DROP TABLE IF EXISTS group_policy_mapping;
CREATE TABLE group_policy_mapping(
	GROUP_ID VARCHAR(45) NOT NULL DEFAULT '',
	POLICY_ID INT NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS notifications;
CREATE TABLE notifications(
	ID INT PRIMARY KEY auto_increment,
	GROUP_ID INT DEFAULT NULL,
	USER_ID VARCHAR(45) DEFAULT NULL,
	DEVICE_ID INT DEFAULT NULL,
	MESSAGE TEXT,
	STATUS VARCHAR(1) DEFAULT NULL,
	SENT_DATE DATETIME DEFAULT NULL,
	RECEIVED_DATE DATETIME DEFAULT NULL,
	RECEIVED_DATA TEXT,
	FEATURE_CODE VARCHAR(45) DEFAULT NULL,
	FEATURE_DESCRIPTION VARCHAR(200) DEFAULT NULL,
	TENANT_ID INT DEFAULT NULL
);


DROP TABLE IF EXISTS platform_policy_mapping;
CREATE TABLE platform_policy_mapping(
	PLATFORM_ID VARCHAR(45) NOT NULL,
	POLICY_ID VARCHAR(45) NOT NULL	
);


DROP TABLE IF EXISTS platformfeatures;
CREATE TABLE platformfeatures(
	ID INT PRIMARY KEY auto_increment,
	PLATFORM_ID INT DEFAULT NULL,
	FEATURE_ID INT DEFAULT NULL,
	MIN_VERSION VARCHAR(45) DEFAULT NULL,
	MAX_VERSION VARCHAR(45) DEFAULT NULL,
	TEMPLATE TEXT	
);

INSERT INTO `platformfeatures` VALUES (1,1,1,'2.2','',''),(2,1,2,'2.2','','wipe'),(3,1,3,'2.2','',''),(4,1,4,'2.2','',''),(5,1,5,'2.2','',''),(6,1,6,'2.2','',''),(7,1,7,'2.2','','notifications'),(8,1,8,'2.2','','wifi'),(9,1,9,'4.0','','camera'),(12,1,12,'2.2','',''),(13,2,1,'4.0','5.0',NULL),(15,2,3,'4.0','5.0',''),(16,2,4,'4.0','5.0',NULL),(17,2,6,'4.0','5.0',NULL),(18,2,8,'4.0','5.0','wifi'),(19,2,9,'4.0','5.0','camera'),(21,3,1,'4.0','5.0',NULL),(23,3,3,'4.0','5.0',''),(24,3,4,'4.0','5.0',NULL),(25,3,6,'4.0','5.0',NULL),(26,3,8,'4.0','5.0','wifi'),(28,3,9,'4.0','5.0','camera'),(30,4,1,'4.0','5.0',NULL),(32,4,3,'4.0','5.0',''),(33,4,4,'4.0','5.0',NULL),(34,4,6,'4.0','5.0',NULL),(35,4,8,'4.0','5.0','wifi'),(36,4,9,'4.0','5.0','camera'),(37,1,15,'3.0',NULL,'encrypt'),(38,1,17,'2.2',NULL,NULL),(39,1,18,'2.2',NULL,NULL),(43,1,19,'2.2',NULL,NULL),(44,1,20,'2.2',NULL,NULL),(45,1,21,'2.2',NULL,'webclip'),(46,1,22,'2.2',NULL,'password_policy'),(49,2,21,'4.0','5.0','webclip'),(50,2,22,'4.0','5.0','password_policy'),(51,3,23,'4.0','5.0','email'),(52,3,24,'4.0','5.0','google_calendar'),(53,3,21,'4.0','5.0','webclip'),(54,3,22,'4.0','5.0','password_policy'),(55,2,23,'4.0','5.0','email'),(56,2,24,'4.0','5.0','google_calendar'),(57,1,25,'2.2',NULL,NULL),(58,1,29,'2.2',NULL,'change-password'),(59,2,30,'4.0','5.0',NULL),(60,3,30,'4.0','5.0',NULL),(61,2,16,'4.0','5.0','apn'),(62,3,16,'4.0','5.0','apn'),(65,2,27,'4.0','5.0','ldap'),(66,3,27,'4.0','5.0','ldap'),(67,1,23,'2.2',NULL,'email'),(68,1,31,'2.2',NULL,NULL),(69,2,31,'2.2',NULL,NULL),(70,3,31,'2.2',NULL,NULL),(71,4,31,'2.2',NULL,NULL),(72, 2, 12, '4.0', '5.0', NULL), (73, 3, 12, '4.0', '5.0', NULL), (74, 4, 12, '4.0', '5.0', NULL), (75, 2, 7, '4.0', '5.0', 'notifications'), (76, 3, 7, '4.0', '5.0', 'notifications'), (77, 4, 7, '4.0', '5.0', 'notifications');


DROP TABLE IF EXISTS platforms;
CREATE TABLE platforms(
	ID INT PRIMARY KEY auto_increment,
	NAME VARCHAR(45) DEFAULT NULL,
	DESCRIPTION VARCHAR(45) DEFAULT NULL,
	TYPE VARCHAR(45) DEFAULT NULL,
	TYPE_NAME VARCHAR(50) DEFAULT NULL,
	COLOR VARCHAR(50) DEFAULT NULL
);

INSERT INTO `platforms` VALUES (1,'Android','android phones and tabs','1','Android','#028482'),(2,'iPhone','iphone','2','iOS','#CCCCCC'),(3,'iPad','ipad','2','iOS','#CCCCCC'),(4,'iPod','ipod','2','iOS','#CCCCCC');


DROP TABLE IF EXISTS policies;
CREATE TABLE policies(
	ID INT PRIMARY KEY auto_increment,
	NAME VARCHAR(45) DEFAULT NULL,
	CONTENT TEXT,
	TYPE INT DEFAULT NULL,
	CATEGORY INT DEFAULT NULL,
	TENANT_ID INT DEFAULT NULL,
	MAM_CONTENT TEXT
);


DROP TABLE IF EXISTS tenantplatformfeatures;
CREATE TABLE tenantplatformfeatures(
	ID INT PRIMARY KEY auto_increment,
	TENANT_ID INT DEFAULT NULL,
	PLATFORMFEATURE_ID INT DEFAULT NULL
);

INSERT INTO `tenantplatformfeatures` VALUES (1,'1',1),(2,'1',2),(3,'1',3),(4,'1',4),(5,'1',5),(6,'1',6),(7,'1',7),(8,'1',8),(9,'1',9),(10,'1',10),(11,'1',11),(12,'1',12),(13,'2',1),(14,'2',2),(15,'2',3),(16,'2',4),(17,'2',6),(18,'2',8),(19,'2',9),(20,'2',12),(21,'3',1),(22,'3',2),(23,'3',3),(24,'3',4),(25,'3',6),(26,'3',8),(27,'3',9),(28,'4',1),(29,'4',2),(30,'4',3),(31,'4',6),(32,'4',8),(33,'4',9),(34,'4',12),(35,'-1234',1),(36,'-1234',2),(37,'-1234',3),(38,'-1234',4),(39,'-1234',5),(40,'-1234',6),(41,'-1234',7),(42,'-1234',8),(43,'-1234',9),(44,'-1234',10),(45,'-1234',11),(46,'-1234',12);


DROP TABLE IF EXISTS user_policy_mapping;
CREATE TABLE user_policy_mapping(
	USER_ID VARCHAR(45) NOT NULL,
	POLICY_ID INT NOT NULL	
);


DROP TABLE IF EXISTS device_awake;
CREATE TABLE device_awake(
	ID INT PRIMARY KEY auto_increment,
	DEVICE_ID INT DEFAULT NULL,
	SENT_DATE DATETIME DEFAULT NULL,
	PROCESSED_DATE DATETIME DEFAULT NULL,
	CALL_COUNT INT DEFAULT NULL,
	STATUS VARCHAR(1) DEFAULT NULL
);


DROP TABLE IF EXISTS device_pending;
CREATE TABLE device_pending(
	ID INT PRIMARY KEY auto_increment,
	TENANT_ID INT DEFAULT NULL,
	USER_ID VARCHAR(255) DEFAULT NULL,
	PLATFORM_ID INT DEFAULT NULL,
	PROPERTIES TEXT DEFAULT NULL,
	CREATED_DATE DATETIME DEFAULT NULL,
	STATUS VARCHAR(10) DEFAULT NULL,
	BYOD INT DEFAULT 1,
	VENDOR VARCHAR(11) DEFAULT NULL,
	UDID VARCHAR(4096) DEFAULT NULL,
	TOKEN VARCHAR(255) DEFAULT NULL,
	REQUEST_STATUS INT DEFAULT 0
);


DROP TABLE IF EXISTS policy_device_profiles;
CREATE TABLE policy_device_profiles(
	ID INT PRIMARY KEY auto_increment,
	DEVICE_ID INT DEFAULT NULL,
	FEATURE_CODE VARCHAR(45) DEFAULT NULL
);


DROP TABLE IF EXISTS device_policy;
CREATE TABLE device_policy(
	ID INT PRIMARY KEY auto_increment,
	DEVICE_ID INT DEFAULT NULL,
	TENANT_ID INT DEFAULT NULL,
	POLICY_ID INT DEFAULT NULL,
	PAYLOAD_UIDS TEXT DEFAULT NULL,
	POLICY_PRIORITY_ID INT DEFAULT NULL,
	STATUS VARCHAR(1) DEFAULT NULL,
	DATETIME DATETIME DEFAULT NULL
);

DROP TABLE IF EXISTS policy_priority;
CREATE TABLE policy_priority(
	ID INT PRIMARY KEY auto_increment,
	TYPE VARCHAR(45) DEFAULT NULL,
	PRIORITY INT DEFAULT NULL
);

DROP TABLE IF EXISTS permissions;
CREATE TABLE permissions (
    id INTEGER AUTO_INCREMENT,
    role VARCHAR(30),
    content VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO `policy_priority` (`id`, `type`, `priority`) VALUES (1, 'USERS', 1);
INSERT INTO `policy_priority` (`id`, `type`, `priority`) VALUES (2, 'PLATFORMS', 2);
INSERT INTO `policy_priority` (`id`, `type`, `priority`) VALUES (3, 'ROLES', 3);