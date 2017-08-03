#!/usr/bin/python
# -*- coding: UTF-8 -*-

from qcloud_cos import CosClient
from qcloud_cos import UploadFileRequest
from qcloud_cos import UploadSliceFileRequest
from qcloud_cos import UpdateFileRequest
from qcloud_cos import UpdateFolderRequest
from qcloud_cos import DelFileRequest
from qcloud_cos import DelFolderRequest
from qcloud_cos import CreateFolderRequest
from qcloud_cos import StatFileRequest
from qcloud_cos import StatFolderRequest
from qcloud_cos import ListFolderRequest

import logging
import sys

appid = 1253506722 
secret_id = u'AKIDjKjx2vmhePxKldwwKaeVEl5C8vX8pAPS'
secret_key = u'0rVxEKDuOr9JH5h8OnOn026zhT8bswpi' 
region_info = "tj" 
    
cos_client = CosClient(appid, secret_id, secret_key, region=region_info)
request = UploadFileRequest(u"codingdie01", sys.argv[2].decode("utf-8"), sys.argv[1].decode("utf-8"))

result = cos_client.upload_file(request)
print result

