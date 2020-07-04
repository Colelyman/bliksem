m4_divert(2)m4_dnl  Keep this line at the top of the file.
m4_dnl  ----------------------------------------------------------------------
m4_dnl  Define site-wide macros
m4_dnl  ----------------------------------------------------------------------
m4_changequote(`{"', `"}')m4_dnl
m4_define({"TITLE"},
	{"m4_define({"__TITLE"}, $1)m4_dnl"})m4_dnl
m4_define({"DATE"},
	{"m4_define({"__DATE"}, $1)m4_dnl"})m4_dnl
m4_define({"UPDATE"},
	{"m4_define({"__UPDATE"}, $1)m4_dnl"})m4_dnl
m4_define({"EXCERPT"},
	{"m4_define({"__EXCERPT"}, $1)m4_dnl"})m4_dnl
m4_define({"BODY"},
	{"m4_define({"__BODY"}, $1)m4_dnl"})m4_dnl
m4_dnl TODO fix this
m4_define({"TAGS"},
	{"m4_define({"__TAGS"}, $1)m4_dnl"})m4_dnl
m4_dnl  ----------------------------------------------------------------------
m4_dnl  Configuration of the site
m4_dnl  ----------------------------------------------------------------------
m4_define({"__ROOT"}, {"http://brandon.invergo.net"})m4_dnl
m4_define({"__SITE_TITLE"}, {"Brandon Invergo"})m4_dnl
m4_define({"__SITE_SUBTITLE"}, {""})m4_dnl
m4_define({"__AUTHOR"}, {"Brandon Invergo"})
m4_define({"__EMAIL"}, {"brandon@invergo.net"})
