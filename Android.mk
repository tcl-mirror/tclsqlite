LOCAL_PATH := $(call my-dir)

###########################
#
# tclsqlite3 shared library
#
###########################

include $(CLEAR_VARS)

tcl_path := $(LOCAL_PATH)/../../tcl

include $(tcl_path)/tcl-config.mk

LOCAL_ADDITIONAL_DEPENDENCIES += $(tcl_path)/tcl-config.mk

LOCAL_MODULE := tclsqlite3

LOCAL_ARM_MODE := arm

LOCAL_C_INCLUDES := $(tcl_includes) \
	$(LOCAL_PATH)/icu4c \
	$(LOCAL_PATH)/compat/sqlite3

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

LOCAL_SRC_FILES := \
	generic/tclsqlite3.c \
	compat/sqlite3/shell.c \
	icu4c/dl_icu.c

LOCAL_CFLAGS := $(tcl_cflags) \
	-DSQLITE_3_SUFFIX_ONLY=1 \
	-DSQLITE_LIKE_DOESNT_MATCH_BLOBS=1 \
	-DSQLITE_UNTESTABLE=1 \
	-DSQLITE_OMIT_LOOKASIDE=1 \
	-DSQLITE_SECURE_DELETE=1 \
	-DSQLITE_SOUNDEX=1 \
	-DSQLITE_THREADSAFE=1 \
	-DSQLITE_USE_ALLOCA=1 \
	-DSQLITE_ENABLE_COLUMN_METADATA=1 \
	-DSQLITE_ENABLE_UPDATE_DELETE_LIMIT=1 \
	-DSQLITE_ENABLE_DBPAGE_VTAB=1 \
	-DSQLITE_ENABLE_DBSTAT_VTAB=1 \
	-DSQLITE_ENABLE_EXPLAIN_COMMENTS=1 \
	-DSQLITE_ENABLE_STMTVTAB=1 \
	-DSQLITE_ENABLE_FTS3_PARENTHESIS=1 \
	-DSQLITE_ENABLE_FTS3=1 \
	-DSQLITE_ENABLE_FTS4=1 \
	-DSQLITE_ENABLE_FTS5=1 \
	-DSQLITE_ENABLE_RTREE=1 \
	-DSQLITE_ENABLE_GEOPOLY=1 \
	-DSQLITE_ENABLE_STAT4=1 \
	-DSQLITE_ENABLE_RBU=1 \
	-DSQLITE_ENABLE_ICU=1 \
	-DSQLITE_ENABLE_JSON1=1 \
	-DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
	-DSQLITE_ENABLE_MATH_FUNCTIONS=1 \
	-DSQLITE_HAVE_ZLIB=1 \
	-DHAVE_USLEEP=1 \
	-DHAVE_MREMAP=1 \
	-DHAVE_ISNAN=1 \
	-DU_LIB_SUFFIX_C_NAME=_sqlite3 \
	-DPACKAGE_NAME="\"sqlite\"" \
	-DPACKAGE_VERSION="\"3.35.5\"" \
	-DBUILD_sqlite=1 \
	-Dmain=sqlite3_shell \
	-O2

LOCAL_SHARED_LIBRARIES := libtcl

LOCAL_LDLIBS :=	-llog -lz

include $(BUILD_SHARED_LIBRARY)
