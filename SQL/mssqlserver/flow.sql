create database flow
go
use flow
go
if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_actor')
            and   type = 'U')
   drop table dbo.t_actor
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_command')
            and   type = 'U')
   drop table dbo.t_command
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_config')
            and   type = 'U')
   drop table dbo.t_config
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_group')
            and   type = 'U')
   drop table dbo.t_group
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_instance')
            and   type = 'U')
   drop table dbo.t_instance
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_node')
            and   type = 'U')
   drop table dbo.t_node
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_process')
            and   type = 'U')
   drop table dbo.t_process
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_structure')
            and   type = 'U')
   drop table dbo.t_structure
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_transition')
            and   type = 'U')
   drop table dbo.t_transition
go
/*==============================================================*/
/* Table: t_actor                                               */
/*==============================================================*/
create table dbo.t_actor (
   NID                  varchar(50)          collate Chinese_PRC_CI_AS not null,
   RNID                 varchar(50)          collate Chinese_PRC_CI_AS null,
   IDENTIFICATION       varchar(50)          null,
   APPELLATION          varchar(50)          collate Chinese_PRC_CI_AS null,
   INSTANCEID           varchar(50)          collate Chinese_PRC_CI_AS null,
   CREATEDATETIME       datetime             null constraint DF_t_actor_INSERTDATE default getdate(),
   OPERATION            varchar(50)          collate Chinese_PRC_CI_AS null,
   constraint PK_t_actor primary key (NID)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '����������',
   'user', 'dbo', 'table', 't_actor'
go

execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', 'dbo', 'table', 't_actor', 'column', 'NID'
go

execute sp_addextendedproperty 'MS_Description', 
   '���',
   'user', 'dbo', 'table', 't_actor', 'column', 'RNID'
go

execute sp_addextendedproperty 'MS_Description', 
   '�����߱�ʶ',
   'user', 'dbo', 'table', 't_actor', 'column', 'IDENTIFICATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '�����ߵ�����',
   'user', 'dbo', 'table', 't_actor', 'column', 'APPELLATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ��ID �� T_INSTANCE�����',
   'user', 'dbo', 'table', 't_actor', 'column', 'INSTANCEID'
go

execute sp_addextendedproperty 'MS_Description', 
   '����������ʱ��',
   'user', 'dbo', 'table', 't_actor', 'column', 'CREATEDATETIME'
go

execute sp_addextendedproperty 'MS_Description', 
   '�����߶������������˻ء���ת��',
   'user', 'dbo', 'table', 't_actor', 'column', 'OPERATION'
go

/*==============================================================*/
/* Table: t_command                                             */
/*==============================================================*/
create table dbo.t_command (
   NID                  varchar(50)          collate Chinese_PRC_CI_AS not null,
   RNID                 varchar(50)          collate Chinese_PRC_CI_AS null,
   APPELLATION          varchar(50)          collate Chinese_PRC_CI_AS null,
   SCRIPT               varchar(4000)        collate Chinese_PRC_CI_AS null,
   CONNECTE             varchar(512)         collate Chinese_PRC_CI_AS null,
   PROVIDERNAME         varchar(50)          collate Chinese_PRC_CI_AS null,
   INSTANCEID           varchar(50)          collate Chinese_PRC_CI_AS null,
   COMMANDTYPE          varchar(50)          collate Chinese_PRC_CI_AS null,
   constraint PK_t_command primary key (NID)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '��֧����������',
   'user', 'dbo', 'table', 't_command'
go

execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', 'dbo', 'table', 't_command', 'column', 'NID'
go

execute sp_addextendedproperty 'MS_Description', 
   '�������t_node ����йؼ��������߽ڵ㣬��Ӧ�������',
   'user', 'dbo', 'table', 't_command', 'column', 'RNID'
go

execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', 'dbo', 'table', 't_command', 'column', 'APPELLATION'
go

execute sp_addextendedproperty 'MS_Description', 
   'SQL�ı�',
   'user', 'dbo', 'table', 't_command', 'column', 'SCRIPT'
go

execute sp_addextendedproperty 'MS_Description', 
   '�����ַ���',
   'user', 'dbo', 'table', 't_command', 'column', 'CONNECTE'
go

execute sp_addextendedproperty 'MS_Description', 
   '���ʿͻ�����(System.Data.SqlClient)',
   'user', 'dbo', 'table', 't_command', 'column', 'PROVIDERNAME'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ��ID �� T_INSTANCE�����',
   'user', 'dbo', 'table', 't_command', 'column', 'INSTANCEID'
go

execute sp_addextendedproperty 'MS_Description', 
   '�������ͣ�Ŀǰֻ֧�֣�text���ı�SQL',
   'user', 'dbo', 'table', 't_command', 'column', 'COMMANDTYPE'
go

/*==============================================================*/
/* Table: t_config                                              */
/*==============================================================*/
create table dbo.t_config (
   IDENTIFICATION       bigint               not null,
   APPELLATION          varchar(50)          collate Chinese_PRC_CI_AS null,
   CONNECTE             varchar(512)         collate Chinese_PRC_CI_AS null,
   PROVIDERNAME         varchar(50)          collate Chinese_PRC_CI_AS null,
   constraint PK_t_config primary key (IDENTIFICATION)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '���������ݿ����ñ�',
   'user', 'dbo', 'table', 't_config'
go

execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', 'dbo', 'table', 't_config', 'column', 'IDENTIFICATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '����Դ����',
   'user', 'dbo', 'table', 't_config', 'column', 'APPELLATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '�����ַ���',
   'user', 'dbo', 'table', 't_config', 'column', 'CONNECTE'
go

execute sp_addextendedproperty 'MS_Description', 
   '���ʿͻ�����(System.Data.SqlClient)',
   'user', 'dbo', 'table', 't_config', 'column', 'PROVIDERNAME'
go

/*==============================================================*/
/* Table: t_group                                               */
/*==============================================================*/
create table dbo.t_group (
   NID                  varchar(50)          collate Chinese_PRC_CI_AS not null,
   RNID                 varchar(50)          collate Chinese_PRC_CI_AS null,
   IDENTIFICATION       varchar(50)          null,
   APPELLATION          varchar(50)          collate Chinese_PRC_CI_AS null,
   INSTANCEID           varchar(50)          collate Chinese_PRC_CI_AS null,
   constraint PK_t_role primary key (NID)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '������',
   'user', 'dbo', 'table', 't_group'
go

execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', 'dbo', 'table', 't_group', 'column', 'NID'
go

execute sp_addextendedproperty 'MS_Description', 
   '�������t_node ����йؼ�����һ���ڵ���������',
   'user', 'dbo', 'table', 't_group', 'column', 'RNID'
go

execute sp_addextendedproperty 'MS_Description', 
   '��ı�ʶ',
   'user', 'dbo', 'table', 't_group', 'column', 'IDENTIFICATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '�������',
   'user', 'dbo', 'table', 't_group', 'column', 'APPELLATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ��ID �� T_INSTANCE�����',
   'user', 'dbo', 'table', 't_group', 'column', 'INSTANCEID'
go

/*==============================================================*/
/* Table: t_instance                                            */
/*==============================================================*/
create table dbo.t_instance (
   INSTANCEID           varchar(50)          collate Chinese_PRC_CI_AS not null,
   CREATEDATETIME       datetime             null constraint DF_t_instance_CreateDateTime default getdate(),
   RNID                 varchar(50)          null,
   STRUCTUREID          varchar(50)          collate Chinese_PRC_CI_AS null,
   STATE                varchar(50)          collate Chinese_PRC_CI_AS null constraint DF_t_instance_STATUS default 'running',
   STRUCTUREXML         text                 collate Chinese_PRC_CI_AS null,
   constraint PK_t_instance primary key (INSTANCEID)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ����',
   'user', 'dbo', 'table', 't_instance'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ��ID',
   'user', 'dbo', 'table', 't_instance', 'column', 'INSTANCEID'
go

execute sp_addextendedproperty 'MS_Description', 
   '����ʱ��',
   'user', 'dbo', 'table', 't_instance', 'column', 'CREATEDATETIME'
go

execute sp_addextendedproperty 'MS_Description', 
   '��T_NODE���й���������ǰִ�����̽ڵ�ID',
   'user', 'dbo', 'table', 't_instance', 'column', 'RNID'
go

execute sp_addextendedproperty 'MS_Description', 
   '����ģ��ID t_structure.ID',
   'user', 'dbo', 'table', 't_instance', 'column', 'STRUCTUREID'
go

execute sp_addextendedproperty 'MS_Description', 
   '����״̬�������У�running��������end����ֹ��termination,kill:ɱ�����̣�',
   'user', 'dbo', 'table', 't_instance', 'column', 'STATE'
go

execute sp_addextendedproperty 'MS_Description', 
   '�洢�����������ݽṹ',
   'user', 'dbo', 'table', 't_instance', 'column', 'STRUCTUREXML'
go

/*==============================================================*/
/* Table: t_node                                                */
/*==============================================================*/
create table dbo.t_node (
   NID                  varchar(50)          collate Chinese_PRC_CI_AS not null,
   IDENTIFICATION       varchar(50)          not null,
   APPELLATION          varchar(50)          collate Chinese_PRC_CI_AS null,
   NODETYPE             varchar(50)          collate Chinese_PRC_CI_AS null,
   INSTANCEID           varchar(50)          collate Chinese_PRC_CI_AS null,
   constraint PK_t_node primary key (NID)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '���̽ڵ��',
   'user', 'dbo', 'table', 't_node'
go

execute sp_addextendedproperty 'MS_Description', 
   '�ڵ�ı�ʶ',
   'user', 'dbo', 'table', 't_node', 'column', 'IDENTIFICATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '�ڵ������',
   'user', 'dbo', 'table', 't_node', 'column', 'APPELLATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '�ڵ����ͣ�Start\End\Normal\Decision��',
   'user', 'dbo', 'table', 't_node', 'column', 'NODETYPE'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ��ID �� T_INSTANCE�����',
   'user', 'dbo', 'table', 't_node', 'column', 'INSTANCEID'
go

/*==============================================================*/
/* Table: t_process                                             */
/*==============================================================*/
create table dbo.t_process (
   NID                  varchar(50)          collate Chinese_PRC_CI_AS not null,
   ORIGIN               varchar(50)          null,
   DESTINATION          varchar(50)          null,
   TRANSITIONID         varchar(50)          collate Chinese_PRC_CI_AS null,
   INSTANCEID           varchar(50)          collate Chinese_PRC_CI_AS null,
   NODETYPE             varchar(50)          collate Chinese_PRC_CI_AS null,
   CREATEDATETIME       datetime             null constraint DF_t_process_INSERTDATE default getdate(),
   RNID                 varchar(50)          collate Chinese_PRC_CI_AS null,
   OPERATION            varchar(50)          collate Chinese_PRC_CI_AS null constraint DF_t_process_OPERATE default 'normal',
   constraint PK_t_process primary key (NID)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '��¼������������',
   'user', 'dbo', 'table', 't_process'
go

execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', 'dbo', 'table', 't_process', 'column', 'NID'
go

execute sp_addextendedproperty 'MS_Description', 
   '��ǰ�ڵ�ID ',
   'user', 'dbo', 'table', 't_process', 'column', 'ORIGIN'
go

execute sp_addextendedproperty 'MS_Description', 
   '��ת�ڵ��ID',
   'user', 'dbo', 'table', 't_process', 'column', 'DESTINATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '��ת·�ߵ�ID t_transition.NID',
   'user', 'dbo', 'table', 't_process', 'column', 'TRANSITIONID'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ��ID �� T_INSTANCE�����',
   'user', 'dbo', 'table', 't_process', 'column', 'INSTANCEID'
go

execute sp_addextendedproperty 'MS_Description', 
   '�ڵ�����',
   'user', 'dbo', 'table', 't_process', 'column', 'NODETYPE'
go

execute sp_addextendedproperty 'MS_Description', 
   '����ʱ��',
   'user', 'dbo', 'table', 't_process', 'column', 'CREATEDATETIME'
go

execute sp_addextendedproperty 'MS_Description', 
   '��ת���Ľڵ�NID',
   'user', 'dbo', 'table', 't_process', 'column', 'RNID'
go

execute sp_addextendedproperty 'MS_Description', 
   '�������˻ء���������ת��',
   'user', 'dbo', 'table', 't_process', 'column', 'OPERATION'
go

/*==============================================================*/
/* Table: t_structure                                           */
/*==============================================================*/
create table dbo.t_structure (
   IDENTIFICATION       varchar(50)          collate Chinese_PRC_CI_AS not null,
   APPELLATION          varchar(50)          collate Chinese_PRC_CI_AS null,
   STRUCTUREXML         text                 collate Chinese_PRC_CI_AS null,
   constraint PK_T_STRUCTURE primary key (IDENTIFICATION)
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '����ģ��',
   'user', 'dbo', 'table', 't_structure'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʶ GUID',
   'user', 'dbo', 'table', 't_structure', 'column', 'IDENTIFICATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '����ͼģ������',
   'user', 'dbo', 'table', 't_structure', 'column', 'APPELLATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '�洢�����������ݽṹ',
   'user', 'dbo', 'table', 't_structure', 'column', 'STRUCTUREXML'
go

/*==============================================================*/
/* Table: t_transition                                          */
/*==============================================================*/
create table dbo.t_transition (
   NID                  varchar(50)          collate Chinese_PRC_CI_AS not null,
   RNID                 varchar(50)          collate Chinese_PRC_CI_AS null,
   APPELLATION          varchar(128)         collate Chinese_PRC_CI_AS null,
   DESTINATION          varchar(50)          null,
   ORIGIN               varchar(50)          null,
   INSTANCEID           varchar(50)          collate Chinese_PRC_CI_AS null,
   EXPRESSION           varchar(50)          collate Chinese_PRC_CI_AS null,
   constraint PK_t_transition_1 primary key (NID)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '������ת·��',
   'user', 'dbo', 'table', 't_transition'
go

execute sp_addextendedproperty 'MS_Description', 
   '����',
   'user', 'dbo', 'table', 't_transition', 'column', 'NID'
go

execute sp_addextendedproperty 'MS_Description', 
   '�ߵ�����',
   'user', 'dbo', 'table', 't_transition', 'column', 'APPELLATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '��ת���ڵ�ID',
   'user', 'dbo', 'table', 't_transition', 'column', 'DESTINATION'
go

execute sp_addextendedproperty 'MS_Description', 
   '��ǰ�ڵ�ID',
   'user', 'dbo', 'table', 't_transition', 'column', 'ORIGIN'
go

execute sp_addextendedproperty 'MS_Description', 
   '������ʵ��ID �� T_INSTANCE�����',
   'user', 'dbo', 'table', 't_transition', 'column', 'INSTANCEID'
go

execute sp_addextendedproperty 'MS_Description', 
   '���ʽ��ֻ�з�֧���ã�',
   'user', 'dbo', 'table', 't_transition', 'column', 'EXPRESSION'
go
