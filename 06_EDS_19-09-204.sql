Delete FROM dbo.DATASOURCEXSLT WHERE OwnerID = 985 AND sourceid IN (368, 369, 363, 367, 365, 366)
Delete FROM dbo.MashupQueryParameter WHERE OwnerID = 985 AND DataSourceId IN (368, 369, 363, 367, 365, 366)
Delete FROM dbo.MashupParamMapping WHERE OwnerID = 985 AND DataSourceId IN (368, 369, 363, 367, 365, 366)
Delete FROM dbo.MashupDataSourceField WHERE OwnerID = 985 AND (ParentGroupID IN (SELECT GroupID FROM dbo.MashupDataSourceField where OwnerID = 985 AND GroupID > 0 and Type = 'Collection' and DataSourceId IN (368, 369, 363, 367, 365, 366)) OR FieldId IN (SELECT GroupID FROM dbo.MashupDataSourceField where OwnerID = 985 AND GroupID > 0 and Type = 'Collection' and DataSourceId IN (368, 369, 363, 367, 365, 366)))
Delete FROM dbo.MashupDataSourceField WHERE OwnerID = 985 AND DataSourceId IN (368, 369, 363, 367, 365, 366)
Delete FROM dbo.MashupDataSource WHERE OwnerID = 985 AND DATASOURCEID IN (368, 369, 363, 367, 365, 366)

INSERT INTO [dbo].[MashupDataSource] (OwnerId,DataSourceId,ConnectionId,Name,SourceType,Source,ReturnType,ReturnMode,DataXPath,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,ErrorCodePath,ErrorStringPath,PrimaryField,IsUTCDatetime,ErrorCodeFieldId,ErrorMsgFieldId,TransactionField,SuccessCode,IndexParameter,BatchSize,TotalCountXPath,BatchParameter,UserIdParameter,CurrentTimeField,InputDateTimeFormat,EnableLogging,RetentionPeriod,InitialSymbols,RenameSymbols,XSLT,Description,XSLTReferenceField,RestInvokeMethod,UseEncryption,EncryptionKey,RestInputMode,ImageHeight,ImageWidth,ImageFormat,XSLTTag,CheckForError,CurrentRecordCountPath,ReplyQueue,WaitInterval,InputXSLT,RemoteQueueManagerName,StringMode,LoginIDField,BranchCodeParameter,BranchIDParameter,BranchNameParameter,IPAddressField,EmployeeCodeField,Password,IsSecurityEnabled,ServiceTypeID,IgnoreHtmlEncode,FaultCodeXPath,FaultMessageXpath,FaultXslt,ENCODING,SkipNodeException,PrevPageTokenXPath,NextPageTokenXPath,AdditionalSettings,OutputLogXSLT,UsedBy,KafkaSourceType,ExceptionMessage,AdapterId,UniqueEdsName,IsAuditEnable,IsMetricsEnable) VALUES(985,363,1,N'Maybank : Fetch Amendments  Details',4,N'MPI_FETCH_AMENDMENTS_DETAILS',17,1,N'',N'Mr. Aryan Shekhar','2024-08-16 09:46:17',N'Mr. Aryan Shekhar','2024-09-19 05:34:54',N'',N'',N'-1',0,-1,-1,N'None',N'',Null,0,N'',Null,N'None',N'None',Null,1,7,Null,Null,N'<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div name="ammendment">
            <table name="resultTable" style="border-color:#dee2e6">
                <style>
                    .header{
                        padding:5px; min-width:200px;border: 1px solid #dee2e6;height: 35px; text-align: center; margin: auto; padding: 7px 5px; font-size: 14px;
                    }
                    .section{
                        padding:5px; min-width:200px;font-weight: bold;background-color:#FFCF01;min-width:200px;border: 1px solid #dee2e6;height: 35px; text-align: left; margin: auto; padding: 7px 5px; font-size: 12px;
                    }
                    .fieldlabel{
                        padding:5px; min-width:200px;font-weight: bold;border: 1px solid #dee2e6;height: 35px; text-align: right; margin: auto; padding: 7px 5px; font-size: 12px;
                    }
                    .data{
                        padding:5px; min-width:200px;border: 1px solid #dee2e6;height: 35px; text-align: center; margin: auto; padding: 7px 5px; font-size: 12px;
                    }
                </style>
                <thead style="background-color:#FFCF01;" class="header" >
                    <th style="border: 1px solid #dee2e6">Amendment Fields</th>
                    <th style="border: 1px solid #dee2e6">Previous</th>
                    <th style="border: 1px solid #dee2e6">Current</th>
                </thead>
                <tbody>
                   <xsl:for-each select="NewDataSet/Table">
				   			<tr>
							<td colspan="3" class="section" >COMPUTATIONS</td>
						</tr>
						<tr>
							<td style="border: 1px solid #dee2e6;" class="fieldlabel">Score Decision</td>
								<td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_SCORE" /></td>
							<td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="SCORE" /></td>
						
						</tr>
						<tr>
							<td style="border: 1px solid #dee2e6;" class="fieldlabel">Green Lane</td>
							<td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_GREENLANE" /></td>
							<td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="GREENLANE"/></td>
						</tr>
						<tr>
							<td style="border: 1px solid #dee2e6;" class="fieldlabel">DSCR</td>
							<td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DSCR" /></td>
							<td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DSCR" /></td>
						</tr>
                    <tr>
                        <td colspan="3" class="section" >VEHICLE DETAILS</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Car Brand</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_CAR_BRAND" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="CAR_BRAND" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Car Model</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_CAR_MODEL" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="CAR_MODEL" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Car Variant and Transmission</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_CAR_VARIANT_TRANSMISSION" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="CAR_VARIANT_TRANSMISSION" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Car Engine Type</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_CAR_ENGINE_TYPE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="CAR_ENGINE_TYPE" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Car Type</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_CAR_TYPE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="CAR_TYPE" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Year Model</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_YEAR_MODEL" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="YEAR_MODEL" /></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="section" >LOAN DETAILS</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Net Cash Price</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_FA_Net_Cash_Price" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="FA_Net_Cash_Price" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Term in Months</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_FA_TERM_IN_MONTHS" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="FA_TERM_IN_MONTHS" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Downpayment %</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DOWNPAYMENT_PERC" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DOWNPAYMENT_PERC" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Downpayment</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DOWNPAYMENT" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DOWNPAYMENT" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Amount Financed %</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_Amount_Financed_PERC" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="Amount_Financed_PERC" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Amount Financed</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_FA_Amount_Financed" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="FA_Amount_Financed" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Add-On Rate</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_ADD_ON_RATE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="ADD_ON_RATE" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Net Monthly Installment</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_NMI" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="NMI" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total DI %</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DI_PERC" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DI_PERC" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total SMC %</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_SMC_PERC" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="SMC_PERC" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total INS-CMF %</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_INS_CMF_PERC" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="INS_CMF_PERC" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total Tuck-ins</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_TOTAL_TUCKINS" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="TOTAL_TUCKINS" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Dealer Subsidy</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DEALER_SUBSIDY" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DEALER_SUBSIDY" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">INAP Months</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_INAP_MONTHS" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="INAP_MONTHS" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">EY</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_EY" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="EY" /></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="section" >APPLICATION DETAILS</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Application Type </td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_APP_TYPE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="APP_TYPE" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">CA/PO</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_CA_PO" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="CA_PO" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Account Source</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_ACCOUNT_SOURCE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="ACCOUNT_SOURCE" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Tran Type</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_TRAN_TYPE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="TRAN_TYPE" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Dealer Name</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DEALER_NAME" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DEALER_NAME" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Dealer Email</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DEALER_EMAIL" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DEALER_EMAIL" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Vehicle Usage</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_VEHICLE_USAGE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="VEHICLE_USAGE" /></td>
                    </tr>
					 <tr>
                        <td colspan="3" class="section" >PROMO DETAILS</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Promo Code</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_PROMO_CODE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PROMO_CODE" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Promo Name</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_PROMO_NAME" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PROMO_NAME" /></td>
                    </tr>
       
                    <tr>
                        <td colspan="3" class="section" >LOAN DETAILS - OTHERS</td>
                    </tr>
                   <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Actual Cash Out </td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_ACTUAL_CASH_OUT" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="ACTUAL_CASH_OUT" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total Dealer Incentive</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_TOTAL_DI" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="TOTAL_DI" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total Salesman Commission</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_TOTAL_SALESMAN_COMMISION" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="TOTAL_SALESMAN_COMMISION" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total Insurance / Chattel Fees</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_TOTAL_INS_CHATTEL_FEES" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="TOTAL_INS_CHATTEL_FEES" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total Tuck-ins</td>
                        <td style="border: 1px solid #dee2e6;" class="data"></td>
                        <td style="border: 1px solid #dee2e6;" class="data"></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">In Advance Payment Amount</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_ADVANCE_PAYMENT" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="ADVANCE_PAYMENT" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Promissory Note Amount</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_PROMISSORY_NOTE" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PROMISSORY_NOTE" /></td>
                    </tr>
                   <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Other Deferred Credit Interest</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_DEFFERED_CREDIT_INTEREST" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="DEFFERED_CREDIT_INTEREST" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Total Interest</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_TOTAL_INTEREST" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="TOTAL_INTEREST" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Prompt Payment Discount</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_PROMPT_PAYMENT_DISCOUNT" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PROMPT_PAYMENT_DISCOUNT" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Gross Monthly Installment</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_GROSS_MONTHLY_INSTALLMENT" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="GROSS_MONTHLY_INSTALLMENT" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Simple Interest Rate</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_SIMPLE_INTEREST" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="SIMPLE_INTEREST" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">IRR</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_IRR" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="IRR" /></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #dee2e6;" class="fieldlabel">Doc Stamps Tax</td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="PREV_STAMP_TAX" /></td>
                        <td style="border: 1px solid #dee2e6;" class="data"><xsl:value-of select="STAMP_TAX" /></td>
                    </tr>
                    </xsl:for-each>   
                </tbody>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>
',N'Maybank : Fetch Amendments for detail page',N'None',1,0,Null,0,0,0,Null,N'',0,N'',Null,0,Null,Null,0,N'None',N'None',N'None',N'None',N'None',N'None',N'',Null,Null,0,Null,Null,Null,Null,Null,Null,Null,N'{"loginputafterxslt":false}',Null,0,0,N'',Null,Null,0,0)
INSERT INTO [dbo].[MashupDataSource] (OwnerId,DataSourceId,ConnectionId,Name,SourceType,Source,ReturnType,ReturnMode,DataXPath,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,ErrorCodePath,ErrorStringPath,PrimaryField,IsUTCDatetime,ErrorCodeFieldId,ErrorMsgFieldId,TransactionField,SuccessCode,IndexParameter,BatchSize,TotalCountXPath,BatchParameter,UserIdParameter,CurrentTimeField,InputDateTimeFormat,EnableLogging,RetentionPeriod,InitialSymbols,RenameSymbols,XSLT,Description,XSLTReferenceField,RestInvokeMethod,UseEncryption,EncryptionKey,RestInputMode,ImageHeight,ImageWidth,ImageFormat,XSLTTag,CheckForError,CurrentRecordCountPath,ReplyQueue,WaitInterval,InputXSLT,RemoteQueueManagerName,StringMode,LoginIDField,BranchCodeParameter,BranchIDParameter,BranchNameParameter,IPAddressField,EmployeeCodeField,Password,IsSecurityEnabled,ServiceTypeID,IgnoreHtmlEncode,FaultCodeXPath,FaultMessageXpath,FaultXslt,ENCODING,SkipNodeException,PrevPageTokenXPath,NextPageTokenXPath,AdditionalSettings,OutputLogXSLT,UsedBy,KafkaSourceType,ExceptionMessage,AdapterId,UniqueEdsName,IsAuditEnable,IsMetricsEnable) VALUES(985,365,1,N'MPI :GET RECOMPUTED AMENDMENTS ',4,N'MPI_GET_RECOMPUTED_AMENDMENTS ',1,1,N'',N'Mr. Aryan Shekhar','2024-08-28 05:51:55',N'Mr. Aryan Shekhar','2024-08-30 10:23:41',N'',N'',N'-1',0,-1,-1,N'None',N'',Null,0,N'',Null,N'None',N'None',Null,1,7,Null,Null,N'',N'FETCH RECOMPUTED APP SCORE, GREEN LANE AND DSCR FOR AMMENDMENTS',N'None',1,0,Null,0,0,0,Null,N'',0,N'',Null,0,Null,Null,0,N'None',N'None',N'None',N'None',N'None',N'None',N'',Null,Null,0,Null,Null,Null,Null,Null,Null,Null,N'{"loginputafterxslt":false}',Null,0,0,N'',Null,Null,0,0)
INSERT INTO [dbo].[MashupDataSource] (OwnerId,DataSourceId,ConnectionId,Name,SourceType,Source,ReturnType,ReturnMode,DataXPath,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,ErrorCodePath,ErrorStringPath,PrimaryField,IsUTCDatetime,ErrorCodeFieldId,ErrorMsgFieldId,TransactionField,SuccessCode,IndexParameter,BatchSize,TotalCountXPath,BatchParameter,UserIdParameter,CurrentTimeField,InputDateTimeFormat,EnableLogging,RetentionPeriod,InitialSymbols,RenameSymbols,XSLT,Description,XSLTReferenceField,RestInvokeMethod,UseEncryption,EncryptionKey,RestInputMode,ImageHeight,ImageWidth,ImageFormat,XSLTTag,CheckForError,CurrentRecordCountPath,ReplyQueue,WaitInterval,InputXSLT,RemoteQueueManagerName,StringMode,LoginIDField,BranchCodeParameter,BranchIDParameter,BranchNameParameter,IPAddressField,EmployeeCodeField,Password,IsSecurityEnabled,ServiceTypeID,IgnoreHtmlEncode,FaultCodeXPath,FaultMessageXpath,FaultXslt,ENCODING,SkipNodeException,PrevPageTokenXPath,NextPageTokenXPath,AdditionalSettings,OutputLogXSLT,UsedBy,KafkaSourceType,ExceptionMessage,AdapterId,UniqueEdsName,IsAuditEnable,IsMetricsEnable) VALUES(985,366,1,N'MPI_COMPARE_AMENDMENTS',4,N'MPI_COMPARE_AMENDMENTS',1,1,N'',N'Mr. Aryan Shekhar','2024-09-05 09:22:35',N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',N'',N'-1',0,-1,-1,N'None',N'',Null,0,N'',Null,N'None',N'None',Null,1,7,Null,Null,N'',N'COMPARE AMENDMENTS FOR POST APPROVAL FINALIZATION  ',N'None',1,0,Null,0,0,0,Null,N'',0,N'',Null,0,Null,Null,0,N'None',N'None',N'None',N'None',N'None',N'None',N'',Null,Null,0,Null,Null,Null,Null,Null,Null,Null,N'{"loginputafterxslt":false}',Null,0,0,N'',Null,Null,0,0)
INSERT INTO [dbo].[MashupDataSource] (OwnerId,DataSourceId,ConnectionId,Name,SourceType,Source,ReturnType,ReturnMode,DataXPath,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,ErrorCodePath,ErrorStringPath,PrimaryField,IsUTCDatetime,ErrorCodeFieldId,ErrorMsgFieldId,TransactionField,SuccessCode,IndexParameter,BatchSize,TotalCountXPath,BatchParameter,UserIdParameter,CurrentTimeField,InputDateTimeFormat,EnableLogging,RetentionPeriod,InitialSymbols,RenameSymbols,XSLT,Description,XSLTReferenceField,RestInvokeMethod,UseEncryption,EncryptionKey,RestInputMode,ImageHeight,ImageWidth,ImageFormat,XSLTTag,CheckForError,CurrentRecordCountPath,ReplyQueue,WaitInterval,InputXSLT,RemoteQueueManagerName,StringMode,LoginIDField,BranchCodeParameter,BranchIDParameter,BranchNameParameter,IPAddressField,EmployeeCodeField,Password,IsSecurityEnabled,ServiceTypeID,IgnoreHtmlEncode,FaultCodeXPath,FaultMessageXpath,FaultXslt,ENCODING,SkipNodeException,PrevPageTokenXPath,NextPageTokenXPath,AdditionalSettings,OutputLogXSLT,UsedBy,KafkaSourceType,ExceptionMessage,AdapterId,UniqueEdsName,IsAuditEnable,IsMetricsEnable) VALUES(985,367,1,N'MPI_DEALER_NAME',4,N'MPI_DEALER_NAME',1,1,N'',N'Mr. Aryan Shekhar','2024-09-16 08:38:32',N'Mr. Aryan Shekhar','2024-09-16 08:41:08',N'',N'',N'-1',0,-1,-1,N'None',N'',Null,0,N'',Null,N'None',N'None',Null,0,0,Null,Null,N'',N'FETCH DEALER NAME ON BASIS OF DEALER CODE',N'None',1,0,Null,0,0,0,Null,N'',0,N'',Null,0,Null,Null,0,N'None',N'None',N'None',N'None',N'None',N'None',N'',Null,Null,0,Null,Null,Null,Null,Null,Null,Null,N'{"loginputafterxslt":false}',Null,0,0,N'',Null,Null,0,0)
INSERT INTO [dbo].[MashupDataSource] (OwnerId,DataSourceId,ConnectionId,Name,SourceType,Source,ReturnType,ReturnMode,DataXPath,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,ErrorCodePath,ErrorStringPath,PrimaryField,IsUTCDatetime,ErrorCodeFieldId,ErrorMsgFieldId,TransactionField,SuccessCode,IndexParameter,BatchSize,TotalCountXPath,BatchParameter,UserIdParameter,CurrentTimeField,InputDateTimeFormat,EnableLogging,RetentionPeriod,InitialSymbols,RenameSymbols,XSLT,Description,XSLTReferenceField,RestInvokeMethod,UseEncryption,EncryptionKey,RestInputMode,ImageHeight,ImageWidth,ImageFormat,XSLTTag,CheckForError,CurrentRecordCountPath,ReplyQueue,WaitInterval,InputXSLT,RemoteQueueManagerName,StringMode,LoginIDField,BranchCodeParameter,BranchIDParameter,BranchNameParameter,IPAddressField,EmployeeCodeField,Password,IsSecurityEnabled,ServiceTypeID,IgnoreHtmlEncode,FaultCodeXPath,FaultMessageXpath,FaultXslt,ENCODING,SkipNodeException,PrevPageTokenXPath,NextPageTokenXPath,AdditionalSettings,OutputLogXSLT,UsedBy,KafkaSourceType,ExceptionMessage,AdapterId,UniqueEdsName,IsAuditEnable,IsMetricsEnable) VALUES(985,368,1,N'MPI_Amount Financed_PERCENTAGE',4,N'MPI_CALCULATE_AMOUNT_FINANCED_PERCENTAGE',1,1,N'',N'Mr. nilabh kumar','2024-09-17 06:37:07',N'Mr. Aryan Shekhar','2024-09-17 10:32:53',N'',N'',N'-1',0,-1,-1,N'None',N'',Null,0,N'',Null,N'None',N'None',Null,0,0,Null,Null,N'',N'',N'None',1,0,Null,0,0,0,Null,N'',0,N'',Null,0,Null,Null,0,N'None',N'None',N'None',N'None',N'None',N'None',N'',Null,Null,0,Null,Null,Null,Null,Null,Null,Null,N'{"loginputafterxslt":false}',Null,0,0,N'',Null,Null,0,0)
INSERT INTO [dbo].[MashupDataSource] (OwnerId,DataSourceId,ConnectionId,Name,SourceType,Source,ReturnType,ReturnMode,DataXPath,CreatedBy,CreatedOn,LastModifiedBy,LastModifiedOn,ErrorCodePath,ErrorStringPath,PrimaryField,IsUTCDatetime,ErrorCodeFieldId,ErrorMsgFieldId,TransactionField,SuccessCode,IndexParameter,BatchSize,TotalCountXPath,BatchParameter,UserIdParameter,CurrentTimeField,InputDateTimeFormat,EnableLogging,RetentionPeriod,InitialSymbols,RenameSymbols,XSLT,Description,XSLTReferenceField,RestInvokeMethod,UseEncryption,EncryptionKey,RestInputMode,ImageHeight,ImageWidth,ImageFormat,XSLTTag,CheckForError,CurrentRecordCountPath,ReplyQueue,WaitInterval,InputXSLT,RemoteQueueManagerName,StringMode,LoginIDField,BranchCodeParameter,BranchIDParameter,BranchNameParameter,IPAddressField,EmployeeCodeField,Password,IsSecurityEnabled,ServiceTypeID,IgnoreHtmlEncode,FaultCodeXPath,FaultMessageXpath,FaultXslt,ENCODING,SkipNodeException,PrevPageTokenXPath,NextPageTokenXPath,AdditionalSettings,OutputLogXSLT,UsedBy,KafkaSourceType,ExceptionMessage,AdapterId,UniqueEdsName,IsAuditEnable,IsMetricsEnable) VALUES(985,369,1,N'MPI_UPDATE_AMENDMENT_DETAILS',4,N'MPI_UPDATE_AMENDMENT_DETAILS',1,1,N'',N'Mr. Aryan Shekhar','2024-09-17 09:47:08',N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',N'',N'-1',0,-1,-1,N'None',N'',Null,0,N'',Null,N'None',N'None',Null,1,7,Null,Null,N'',N'UPDATE AMENDMENT DEATILS',N'None',1,0,Null,0,0,0,Null,N'',0,N'',Null,0,Null,Null,0,N'None',N'None',N'None',N'None',N'None',N'None',N'',Null,Null,0,Null,Null,Null,Null,Null,Null,Null,N'{"loginputafterxslt":false}',Null,0,0,N'',Null,Null,0,0)

GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MPI_FETCH_AMENDMENTS_DETAILS]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[MPI_FETCH_AMENDMENTS_DETAILS]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

    
    
CREATE OR ALTER PROC [dbo].[MPI_FETCH_AMENDMENTS_DETAILS] (@FA_ID INT, @AMENDMENT_ID INT)              
AS        
/*              
CREATED BY : ARYAN SHEKHAR              
CREATED ON : 14-08-2024              
DESCRIPTION: FETCH AMENDMENTS FOR POST APPROVAL FINALIZATION                  
EXEC MPI_FETCH_AMENDMENTS_DETAILS 00103676         
EXEC MPI_FETCH_AMENDMENTS_DETAILS 103651 00103541         
EXEC MPI_FETCH_AMENDMENTS_DETAILS 103838,103882        
*/        
BEGIN         
    -- Temporarily store the previous record's history ID        
    SELECT HISTORYID, CUSTOMOBJECTID INTO #TEMP        
    FROM FinancialApplicationHistory        
    WHERE OWNERID = 985 AND CUSTOMOBJECTID = @FA_ID        
    ORDER BY HISTORYID DESC        
    OFFSET 1 ROWS        
    FETCH NEXT 1 ROWS ONLY;        
         
        
        
    DECLARE @HISTORYID INT;        
    SELECT @HISTORYID = HISTORYID FROM #TEMP;        
        
    -- Fetch both previous and current values in a single SELECT statement        
   SELECT                
    -- Previous Vehicle Details       
 FH5.Fia_ex5_69  AS PREV_SCORE,      
 FH5.Fia_ex5_174 AS PREV_GREENLANE,      
FORMAT(CAST(FH5.Fia_ex5_130 AS decimal(18, 2)), '0.00') AS PREV_DSCR,      
    FH3.Fia_ex3_75 AS PREV_CAR_BRAND,        
    FH3.Fia_ex3_77 AS PREV_CAR_MODEL,            
    FH3.Fia_ex3_78 AS PREV_CAR_VARIANT_TRANSMISSION,            
    FH3.Fia_ex3_79 AS PREV_CAR_ENGINE_TYPE,            
    FH3.Fia_ex3_76 AS PREV_CAR_TYPE,            
    FH5.Fia_ex5_99 AS PREV_YEAR_MODEL,          
            
    -- Current Vehicle Details      
 F1.Fia_ex1_145 AS SCORE,      
 F1.Fia_ex1_144 AS GREENLANE,      
FORMAT(CAST(F1.Fia_ex1_143 AS decimal(18, 2)), '0.00') AS DSCR,        
    F2.Fia_ex2_118 AS CAR_BRAND,            
    F2.Fia_ex2_119 AS CAR_MODEL,            
    F2.Fia_ex2_120 AS CAR_VARIANT_TRANSMISSION,            
    F2.Fia_ex2_121 AS CAR_ENGINE_TYPE,            
    F2.Fia_ex2_122 AS CAR_TYPE,            
    F2.Fia_ex2_123 AS YEAR_MODEL,            
        
    -- Previous Loan Details            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH1.Fia_ex1_20 AS decimal(18, 2)), 'N2')) AS PREV_FA_Net_Cash_Price,             
    FH1.Fia_ex1_24 AS PREV_FA_TERM_IN_MONTHS,            
    CONCAT(FORMAT(CAST(FH1.Fia_ex1_22 AS decimal(18, 2)), '0.00'),' %') AS PREV_DOWNPAYMENT_PERC,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH5.Fia_ex5_72 AS decimal(18, 2)), 'N2')) AS PREV_DOWNPAYMENT,            
    CONCAT(FORMAT(CAST(FH3.Fia_ex3_18 AS decimal(18, 2)), '0.00'),' %') AS PREV_Amount_Financed_PERC,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH1.Fia_ex1_21  AS decimal(18, 2)), 'N2')) AS PREV_FA_Amount_Financed,              
    CONCAT(FORMAT(CAST(FH1.Fia_ex1_46 AS decimal(18, 2)), '0.00'),' %') AS PREV_ADD_ON_RATE,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH1.Fia_ex1_25  AS decimal(18, 2)), 'N2')) AS PREV_NMI,            
    CONCAT(FORMAT(CAST(FH1.Fia_ex1_51 AS decimal(18, 2)), '0.00'),' %') AS PREV_DI_PERC,            
    CONCAT(FORMAT(CAST(FH1.Fia_ex1_52 AS decimal(18, 2)), '0.00'),' %') AS PREV_SMC_PERC,            
    CONCAT(FORMAT(CAST(FH1.Fia_ex1_53 AS decimal(18, 2)), '0.00'),' %') AS PREV_INS_CMF_PERC,            
    CONCAT(FORMAT(CAST(FH1.Fia_ex1_54 AS decimal(18, 2)), '0.00'),' %') AS PREV_TOTAL_TUCKINS,            
    CONCAT(FORMAT(CAST(FH3.Fia_ex3_42 AS decimal(18, 2)), '0.00'),' %') AS PREV_DEALER_SUBSIDY,            
    FH1.Fia_ex1_47 AS PREV_INAP_MONTHS,            
    CONCAT(FORMAT(CAST(FH5.Fia_ex5_124 AS decimal(18, 2)), '0.00'),' %') AS PREV_EY,          
        
    -- Current Loan Details            
    CONCAT(NCHAR(8369), FORMAT(CAST(F2.Fia_ex2_124 AS decimal(18, 2)), 'N2')) AS FA_Net_Cash_Price,              
    F1.Fia_ex1_122 AS FA_TERM_IN_MONTHS,            
    CONCAT(FORMAT(CAST(F1.Fia_ex1_123 AS decimal(18, 2)), '0.00'),' %') AS DOWNPAYMENT_PERC,            
    CONCAT(NCHAR(8369), FORMAT(CAST(F2.Fia_ex2_125 AS decimal(18, 2)), 'N2')) AS DOWNPAYMENT,            
    CONCAT(FORMAT(CAST(F3.Fia_ex3_128 AS decimal(18, 2)), '0.00'),' %') AS Amount_Financed_PERC,            
    CONCAT(NCHAR(8369), FORMAT(CAST(F1.Fia_ex1_124 AS decimal(18, 2)), 'N2')) AS FA_Amount_Financed,              
    CONCAT(FORMAT(CAST(F1.Fia_ex1_125 AS decimal(18, 2)), '0.00'),' %') AS ADD_ON_RATE,            
    CONCAT(NCHAR(8369), FORMAT(CAST(F1.Fia_ex1_126 AS decimal(18, 2)), 'N2')) AS NMI,            
    CONCAT(FORMAT(CAST(F1.Fia_ex1_127 AS decimal(18, 2)), '0.00'),' %') AS DI_PERC,            
    CONCAT(FORMAT(CAST(F2.Fia_ex2_127 AS decimal(18, 2)), '0.00'),' %') AS SMC_PERC,            
    CONCAT(FORMAT(CAST(F1.Fia_ex1_128 AS decimal(18, 2)), '0.00'),' %') AS INS_CMF_PERC,            
    CONCAT(FORMAT(CAST(F1.Fia_ex1_129 AS decimal(18, 2)), '0.00'),' %') AS TOTAL_TUCKINS,            
    CONCAT(FORMAT(CAST(F3.Fia_ex3_130 AS decimal(18, 2)), '0.00'),' %') AS DEALER_SUBSIDY,            
    F1.Fia_ex1_130 AS INAP_MONTHS,            
    CONCAT(FORMAT(CAST(F2.Fia_ex2_134 AS decimal(18, 2)), '0.00'),' %') AS EY,            
        
    -- Previous Application Details            
    (SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = FH2.Fia_ex2_87) AS PREV_APP_TYPE,            
    (SELECT TOP 1 VALUE FROM MPI_MDM_CA_PO WHERE OWNERID = 985 AND CODE = FH3.Fia_ex3_6) AS PREV_CA_PO,            
    --(SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = F2.Fia_ex2_90) AS PREV_ACCOUNT_SOURCE,     
 --(SELECT TOP 1 FIA_EX2_90 FROM Fia_ex2 WHERE ownerID = 985 AND fia_ex2_id = @FA_ID) AS PREV_ACCOUNT_SOURCE,    
      (SELECT TOP 1          CASE              WHEN FIA_EX2_90 = 'A00A' THEN 'Branch'             WHEN FIA_EX2_90 = 'A00C' THEN 'Broker / Agent'             WHEN FIA_EX2_90 = 'A001' THEN 'Dealer'             WHEN FIA_EX2_90 = 'A00B' THEN 'MPI Employee Ref
  
erral'             WHEN FIA_EX2_90 = 'A00E' THEN 'Staff Loan Conversion'             WHEN FIA_EX2_90 = 'A00D' THEN 'Walk-In'         END       FROM Fia_ex2       WHERE ownerID = 985       AND fia_ex2_id = @FA_ID     ) AS PREV_ACCOUNT_SOURCE,    
    
    --(SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = FH2.Fia_ex2_92) AS PREV_TRAN_TYPE,    
 --(SELECT TOP 1 FIA_EX2_92 FROM Fia_ex2 WHERE ownerID = 985 AND fia_ex2_id = @FA_ID) AS PREV_TRAN_TYPE,    
 (SELECT TOP 1     
    CASE     
        WHEN FIA_EX2_92 = '2' THEN '2-party'    
        WHEN FIA_EX2_92 = '3' THEN '3-party'    
    END     
FROM Fia_ex2     
WHERE ownerID = 985     
AND fia_ex2_id = @FA_ID    
) AS PREV_TRAN_TYPE,    
    
    
    (SELECT TOP 1 NAME FROM ACCOUNTS WHERE OWNERID = 985 AND ACCOUNTID = FH3.Fia_ex3_20) AS PREV_DEALER_NAME,            
    FH1.Fia_ex1_33 AS PREV_DEALER_EMAIL,            
    --(SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = FH2.Fia_ex2_89) AS PREV_VEHICLE_USAGE,          
   --(SELECT TOP 1 Fia_ex2_89 FROM Fia_ex2 WHERE ownerID = 985 AND fia_ex2_id = @FA_ID) AS PREV_VEHICLE_USAGE,    
(SELECT TOP 1     
    CASE     
        WHEN FIA_EX2_89 = 'AA' THEN 'Private Use'    
        WHEN FIA_EX2_89 = 'AE' THEN 'Rent-A-Car'    
        WHEN FIA_EX2_89 = 'AF' THEN 'Taxi'    
        WHEN FIA_EX2_89 = 'AI' THEN 'UV Express'    
        WHEN FIA_EX2_89 = 'A1' THEN 'Business Use'    
        WHEN FIA_EX2_89 = 'AJ' THEN 'TNVS (NEW)'    
    END     
FROM Fia_ex2     
WHERE ownerID = 985     
AND fia_ex2_id = @FA_ID    
) AS PREV_VEHICLE_USAGE,    
    
      
    -- Current Application Details            
      
    (SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = F2.Fia_ex2_136) AS APP_TYPE,      
    (SELECT TOP 1 VALUE FROM MPI_MDM_CA_PO WHERE OWNERID = 985 AND CODE = F2.Fia_ex2_137) AS CA_PO,      
    --(SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = F2.Fia_ex2_138) AS ACCOUNT_SOURCE,     
 --(SELECT TOP 1 Fia_ex2_138 FROM Fia_ex2 WHERE ownerID = 985 AND fia_ex2_id = @AMENDMENT_ID) AS ACCOUNT_SOURCE,    
(SELECT TOP 1     
    CASE     
        WHEN Fia_ex2_138 = 'A00A' THEN 'Branch'    
 WHEN Fia_ex2_138 = 'A00C' THEN 'Broker / Agent'    
        WHEN Fia_ex2_138 = 'A001' THEN 'Dealer'    
        WHEN Fia_ex2_138 = 'A00B' THEN 'MPI Employee Referral'    
        WHEN Fia_ex2_138 = 'A00E' THEN 'Staff Loan Conversion'    
        WHEN Fia_ex2_138 = 'A00D' THEN 'Walk-In'    
    END     
FROM Fia_ex2     
WHERE ownerID = 985     
AND fia_ex2_id = @AMENDMENT_ID    
) AS ACCOUNT_SOURCE,    
    
    --(SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = F2.Fia_ex2_139) AS TRAN_TYPE,      
  --(SELECT TOP 1 Fia_ex2_139 FROM Fia_ex2 WHERE ownerID = 985 AND fia_ex2_id = @AMENDMENT_ID) AS TRAN_TYPE,    
(SELECT TOP 1     
    CASE     
        WHEN Fia_ex2_139 = '2' THEN '2-party'    
        WHEN Fia_ex2_139 = '3' THEN '3-party'    
    END     
FROM Fia_ex2     
WHERE ownerID = 985     
AND fia_ex2_id = @AMENDMENT_ID    
) AS TRAN_TYPE,    
    
    (SELECT TOP 1 NAME FROM ACCOUNTS WHERE OWNERID = 985 AND ACCOUNTID = F1.Fia_ex1_133) AS DEALER_NAME,      
    F1.Fia_ex1_131 AS DEALER_EMAIL,      
   -- (SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = F2.Fia_ex2_141) AS VEHICLE_USAGE,      
     --(SELECT TOP 1 Fia_ex2_141 FROM Fia_ex2 WHERE ownerID = 985 AND fia_ex2_id = @AMENDMENT_ID) AS VEHICLE_USAGE,    
(SELECT TOP 1     
    CASE     
        WHEN Fia_ex2_141 = 'AA' THEN 'Private Use'    
        WHEN Fia_ex2_141 = 'AE' THEN 'Rent-A-Car'    
        WHEN Fia_ex2_141 = 'AF' THEN 'Taxi'    
        WHEN Fia_ex2_141 = 'AI' THEN 'UV Express'    
        WHEN Fia_ex2_141 = 'A1' THEN 'Business Use'    
        WHEN Fia_ex2_141 = 'AJ' THEN 'TNVS (NEW)'    
    END     
FROM Fia_ex2     
WHERE ownerID = 985     
AND fia_ex2_id = @AMENDMENT_ID    
) AS VEHICLE_USAGE,    
    --PROMO DETAILS
	 F3.Fia_ex3_94 AS PREV_PROMO_CODE,      
 F3.Fia_ex3_95 AS PREV_PROMO_NAME, 
 	 F2.Fia_ex2_143 AS PROMO_CODE,      
 F2.Fia_ex2_144 AS PROMO_NAME,

    -- Previous Loan Details: Others            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH4.Fia_ex4_12 AS decimal(18, 2)), 'N2')) AS PREV_ACTUAL_CASH_OUT,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH4.Fia_ex4_40 AS decimal(18, 2)), 'N2')) AS PREV_TOTAL_DI,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH4.Fia_ex4_41 AS decimal(18, 2)), 'N2')) AS PREV_TOTAL_SALESMAN_COMMISION,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH3.Fia_ex3_40 AS decimal(18, 2)), 'N2')) AS PREV_TOTAL_INS_CHATTEL_FEES,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH4.Fia_ex4_100 AS decimal(18, 2)), 'N2')) AS PREV_ADVANCE_PAYMENT,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH3.Fia_ex3_46 AS decimal(18, 2)), 'N2')) AS PREV_PROMISSORY_NOTE,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH3.Fia_ex3_48 AS decimal(18, 2)), 'N2')) AS PREV_DEFFERED_CREDIT_INTEREST,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH3.Fia_ex3_47 AS decimal(18, 2)), 'N2')) AS PREV_TOTAL_INTEREST,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH3.Fia_ex3_43 AS decimal(18, 2)), 'N2')) AS PREV_PROMPT_PAYMENT_DISCOUNT,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH3.Fia_ex3_44 AS decimal(18, 2)), 'N2')) AS PREV_GROSS_MONTHLY_INSTALLMENT,            
    CONCAT(FORMAT(CAST(FH5.Fia_ex5_10 AS decimal(18, 2)), '0.00'), ' %') AS PREV_SIMPLE_INTEREST,            
    CONCAT(FORMAT(CAST(FH2.Fia_ex2_42 AS decimal(18, 2)), '0.00'), ' %') AS PREV_IRR,            
    CONCAT(NCHAR(8369), FORMAT(CAST(FH3.Fia_ex3_50 AS decimal(18, 2)), 'N2')) AS PREV_STAMP_TAX,      
      
    -- Current Loan Details: Others            
    CONCAT(NCHAR(8369), FORMAT(F3.Fia_ex3_138, 'N2')) AS ACTUAL_CASH_OUT,           
    CONCAT(NCHAR(8369), FORMAT(F2.Fia_ex2_126, 'N2')) AS TOTAL_DI,           
    CONCAT(NCHAR(8369), FORMAT(F2.Fia_ex2_128, 'N2')) AS TOTAL_SALESMAN_COMMISION,           
    CONCAT(NCHAR(8369), FORMAT(F3.Fia_ex3_129, 'N2')) AS TOTAL_INS_CHATTEL_FEES,           
    CONCAT(NCHAR(8369), FORMAT(F2.Fia_ex2_130, 'N2')) AS ADVANCE_PAYMENT,           
    CONCAT(NCHAR(8369), FORMAT(F3.Fia_ex3_131, 'N2')) AS PROMISSORY_NOTE,           
    CONCAT(NCHAR(8369), FORMAT(F3.Fia_ex3_132, 'N2')) AS DEFFERED_CREDIT_INTEREST,           
    CONCAT(NCHAR(8369), FORMAT(F3.Fia_ex3_133, 'N2')) AS TOTAL_INTEREST,           
    CONCAT(NCHAR(8369), FORMAT(F3.Fia_ex3_134, 'N2')) AS PROMPT_PAYMENT_DISCOUNT,           
    CONCAT(NCHAR(8369), FORMAT(F2.Fia_ex2_131, 'N2')) AS GROSS_MONTHLY_INSTALLMENT,           
    CONCAT(FORMAT(F2.Fia_ex2_132, '0.00'), ' %') AS SIMPLE_INTEREST,           
    CONCAT(FORMAT(F2.Fia_ex2_135, '0.00'), ' %') AS IRR,           
    CONCAT(NCHAR(8369), FORMAT(F3.Fia_ex3_135, 'N2')) AS STAMP_TAX      
      
FROM       
 FinancialApplicationHistory FH      
    INNER JOIN Fia_ex1_HS FH1 ON FH.OWNERID = FH1.OWNERID AND FH.HISTORYID = FH1.HISTORYID AND FH.CUSTOMOBJECTID = FH1.Fia_ex1_ID           
    INNER JOIN Fia_ex2_HS FH2 ON FH.OWNERID = FH2.OWNERID AND FH.HISTORYID = FH2.HISTORYID AND FH.CUSTOMOBJECTID = FH2.Fia_ex2_ID           
    INNER JOIN Fia_ex3_HS FH3 ON FH.OWNERID = FH3.OWNERID AND FH.HISTORYID = FH3.HISTORYID AND FH.CUSTOMOBJECTID = FH3.Fia_ex3_ID           
    INNER JOIN Fia_ex4_HS FH4 ON FH.OWNERID = FH4.OWNERID AND FH.HISTORYID = FH4.HISTORYID AND FH.CUSTOMOBJECTID = FH4.Fia_ex4_ID           
    INNER JOIN Fia_ex5_HS FH5 ON FH.OWNERID = FH5.OWNERID AND FH.HISTORYID = FH5.HISTORYID AND FH.CUSTOMOBJECTID = FH5.Fia_ex5_ID           
    INNER JOIN FinancialApplication F ON F.OWNERID = FH.OWNERID AND F.CUSTOMOBJECTID = @AMENDMENT_ID           
    INNER JOIN Fia_ex1 F1 ON F.OWNERID = F1.OWNERID AND F.CUSTOMOBJECTID = F1.Fia_ex1_ID               
    INNER JOIN Fia_ex2 F2 ON F.OWNERID = F2.OWNERID AND F.CUSTOMOBJECTID = F2.Fia_ex2_ID               
    INNER JOIN Fia_ex3 F3 ON F.OWNERID = F3.OWNERID AND F.CUSTOMOBJECTID = F3.Fia_ex3_ID               
    INNER JOIN Fia_ex4 F4 ON F.OWNERID = F4.OWNERID AND F.CUSTOMOBJECTID = F4.Fia_ex4_ID               
    INNER JOIN Fia_ex5 F5 ON F.OWNERID = F5.OWNERID AND F.CUSTOMOBJECTID = F5.Fia_ex5_ID      
WHERE       
    FH.OWNERID = 985       
    AND FH.HISTORYID = @HISTORYID       
    AND FH.CUSTOMOBJECTID = @FA_ID;      
       
END; 
GO



GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MPI_GET_RECOMPUTED_AMENDMENTS ]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[MPI_GET_RECOMPUTED_AMENDMENTS ]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE MPI_GET_RECOMPUTED_AMENDMENTS            
(            
    @FAID INT,        
    @NEWNMI DECIMAL(10,2)            
)            
AS     
/*-------------------------------------------------              
 CREATED BY : ALI ASGAR BAJI;CREATED ON :27.08.2024;              
 DESC : CREATED FOR RECOMPUTED THE FOLLOWING BASED ON THE CHANGES IN THE AMENDMENTS              
 1. DSCR           
 2. APP SCORE          
 3. GREENLAN          
           
 MPI_GET_RECOMPUTED_AMENDMENTS 103529,278000            
--------------------------------------------------*/       
BEGIN            
    DECLARE @NEWCOMPUTED_DSCR DECIMAL(12,2),            
            @NEWCOMPUTED_APPSCORE NVARCHAR(20),            
            @NEWCOMPUTED_GREENLAN NVARCHAR(10),           
            @NEWTOTALMONTHLYINCOME DECIMAL(12,2);       
    
    -- Fetch the total income based on the FAID      
    SELECT @NEWTOTALMONTHLYINCOME = V5.Ver_ex5_57       
    FROM APPLICATION A      
    INNER JOIN APL_ex1 A1 ON A.OWNERID = A1.OWNERID AND A.APPLICATIONID = A1.APL_ex1_ID      
    INNER JOIN VERIFICATION V ON A.OWNERID = V.OWNERID AND A.APPLICATIONID = V.RELATEDTOID      
    INNER JOIN VER_ex5 V5 ON V.OWNERID = V5.OWNERID AND V.CUSTOMOBJECTID = V5.Ver_ex5_Id      
    WHERE A.OWNERID = 985       
      AND A.RELATEDTOTYPEID = 100286       
      AND A.RELATEDTOID = @FAID      
      AND A1.APL_EX1_53 = 'P'      
      AND V.LAYOUTID=10204018;      
        
    -- CALL THE SP TO RECOMPUTE DSCR AND STORE IT IN THE VARIABLE;           
    DECLARE @RET_TOTALGROSSREVENUE DECIMAL(15,2),        
            @RET_TOTALNMI DECIMAL(15,2);        
        
    EXEC MPI_GET_RECOMPUTED_AMENDMENTS_DSCR         
        @FAID,        
        @NEWTOTALMONTHLYINCOME,  -- Use the fetched total income      
        @NEWNMI,        
        @NEWCOMPUTED_DSCR OUT,        
        @RET_TOTALGROSSREVENUE OUT,        
        @RET_TOTALNMI OUT;            
            
    -- CALL THE SP TO RECOMPUTE THE APP SCORE AND STORE THE VALUES IN VARIABLE;            
    DECLARE @RET_AGE INT,                
            @RET_AGESCORE INT,                
            @RET_PRV NVARCHAR(15),                
            @RET_PROVINCESCORE INT,                
            @RET_PROFESSION NVARCHAR(10),                
            @RET_PROFESSIONSCORE INT,                        
            @RET_NOB INT,                
            @RET_NOBSCORE INT,                        
            @RET_DSCR DECIMAL(10,2),                
            @RET_DSCRSCORE INT,                        
            @RET_LT INT,                
            @RET_LOANTERMSCORE INT,                
            @RET_MOF INT,                
            @RET_MOFSCORE INT,                        
            @RET_TOTALDI DECIMAL(16,6),                
            @RET_TOTALDISCORE INT,                        
            @RET_CRBRND NVARCHAR(20),                
            @RET_CRBRNDSCORE INT,                        
            @RET_AG058S DECIMAL(16,6),                
            @RET_AG058SSCORE INT,                        
            @RET_MOB INT,                
            @RET_MOBSCORE INT,                        
            @RET_UTIL_RATE DECIMAL(16,6),                
            @RET_UTILSCORE INT,                        
            @RET_SCORE INT,                         
            @RET_SB INT,              
            @RET_SCORINGMETHOD NVARCHAR(15),              
            @RET_ASCORE NVARCHAR(10);      
         
    EXEC dbo.MPI_GET_RECOMPUTED_AMENDMENTS_APPSCORE       
        @FAID,       
        @NEWCOMPUTED_DSCR,       
        @NEWCOMPUTED_APPSCORE OUT,        
        @RET_AGE OUT,                
        @RET_AGESCORE OUT,                
        @RET_PRV OUT,                
        @RET_PROVINCESCORE OUT,                
        @RET_PROFESSION OUT,                
        @RET_PROFESSIONSCORE OUT,                        
        @RET_NOB OUT,                
        @RET_NOBSCORE OUT,                        
        @RET_DSCR OUT,                
        @RET_DSCRSCORE OUT,                        
        @RET_LT OUT,                
        @RET_LOANTERMSCORE OUT,                
        @RET_MOF OUT,                
        @RET_MOFSCORE OUT,                        
        @RET_TOTALDI OUT,                
        @RET_TOTALDISCORE OUT,                        
        @RET_CRBRND OUT,                
        @RET_CRBRNDSCORE OUT,                        
        @RET_AG058S OUT,                
        @RET_AG058SSCORE OUT,                        
        @RET_MOB OUT,                
        @RET_MOBSCORE OUT,                        
        @RET_UTIL_RATE OUT,                
        @RET_UTILSCORE OUT,                        
        @RET_SCORE OUT,                         
        @RET_SB OUT,              
        @RET_SCORINGMETHOD OUT,              
        @RET_ASCORE OUT;      
            
    -- CALL THE SP TO RECOMPUTE THE GREENLAN AND STORE THE VALUES IN VARIABLE;            
    DECLARE @RESPONSECODE INT,            
            @RESPONSEMESSAGE NVARCHAR(30),              
            @PDAFINAL NVARCHAR(10),            
            @FINALSCOREBAND NVARCHAR(10),              
            @TOTALAPPLICATIONCOUNT INT,              
            @PRIMARYBORROWERAPPID INT,              
            @MARGINOFFINANCE NVARCHAR(20);            
            
    EXEC dbo.MPI_GET_RECOMPUTED_AMENDMENTS_GREENLAN @FAID,             
        @RESPONSECODE OUTPUT,          
        @RESPONSEMESSAGE OUTPUT,            
        @PDAFINAL OUTPUT,            
        @FINALSCOREBAND OUTPUT,            
        @TOTALAPPLICATIONCOUNT OUTPUT,              
        @PRIMARYBORROWERAPPID OUTPUT,            
        @MARGINOFFINANCE OUTPUT;            
            
    -- Update the computed values in Fia_ex1    
    --UPDATE Fia_ex1      
    --SET Fia_ex1_143 = @NEWCOMPUTED_DSCR,      
    --    Fia_ex1_145 = @NEWCOMPUTED_APPSCORE,      
    --    Fia_ex1_144 = CASE     
    --                    WHEN @RESPONSECODE = 1 THEN 'Yes'     
    --                    WHEN @RESPONSECODE = 2 THEN 'No'     
    --                    ELSE 'Unknown'     
    --                  END      
    --FROM FinancialAPPLICATION FA      
    --INNER JOIN Fia_ex1 FA1 ON FA.OWNERID = FA1.OWNERID AND FA.CustomObjectId = FA1.Fia_ex1_Id        
    --WHERE FA.OWNERID = 985;         
        
    -- Output the results    
    SELECT       
        @NEWCOMPUTED_DSCR AS 'COMPUTEDDSCR',  
        @RET_ASCORE AS 'COMPUTEDAPPSCORE',  
        --@NEWCOMPUTED_APPSCORE AS 'COMPUTEDAPPSCORE',       
        CASE     
            WHEN @RESPONSECODE = 1 THEN 'Yes'     
            WHEN @RESPONSECODE = 2 THEN 'No'     
            ELSE 'Unknown'      
        END AS 'COMPUTEDGREENLAN';      
    
END; 
GO



GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MPI_COMPARE_AMENDMENTS]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[MPI_COMPARE_AMENDMENTS]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[MPI_COMPARE_AMENDMENTS]       
    @FA_ID INT,       
    @CAR_BRAND NVARCHAR(100),    
    @YEAR_MODEL NVARCHAR(100),    
    @TERM_IN_MONTHS INT,    
    @DOWNPAYMENT_PERCENTAGE DECIMAL(10, 2),    
    @DOWNPAYMENT DECIMAL(10, 2),    
    @AMOUNT_FINANCED_PERCENTAGE DECIMAL(10, 2),    
    @AMOUNT_FINANCED DECIMAL(10, 2),    
    @NET_MONTHLY_INSTALLMENT DECIMAL(10, 2),    
    @TOTAL_DI_PERCENTAGE DECIMAL(10, 2),    
    @APPLICATION_TYPE NVARCHAR(100),    
    @ACCOUNT_SOURCE NVARCHAR(100),    
    @VEHICLE_USAGE NVARCHAR(100),    
    @ACTUAL_CASH_OUT DECIMAL(10, 2),    
    @EY NVARCHAR(100),    
    @PAYMENT_MODE NVARCHAR(100),    
    @NAME_SCREENING_RESULT NVARCHAR(100),    
    @OTHER_FACTOR NVARCHAR(100)    
AS      
/*====================================================================================                
CREATED BY : ARYAN SHEKHAR                
CREATED ON : 09-05-2024                
DESCRIPTION: COMPARE AMENDMENTS FOR POST APPROVAL FINALIZATION         
EXEC [MPI_COMPARE_AMENDMENTS]
@FA_ID=103803,
@Car_Brand=NULL,
@Year_Model=NULL,
@Term_in_Months=0,
@Downpayment_Percentage=0,
@Downpayment=0,
@Amount_Financed_Percentage=0,
@Amount_Financed=0,
@Net_Monthly_Installment=0,
@Total_DI_Percentage=0,
@Application_Type=NULL,
@Account_Source=NULL,
@Vehicle_Usage=NULL,
@Actual_Cash_Out=NULL,
@EY='0',
@Payment_Mode=NULL,
@Name_Screening_Result=NULL,
@Other_Factor=''
======================================================================================*/      
BEGIN      
    -- Temporarily store the previous record's history ID      
    SELECT HISTORYID, CUSTOMOBJECTID INTO #TEMP      
    FROM FinancialApplicationHistory      
    WHERE OWNERID = 985 AND CUSTOMOBJECTID = @FA_ID      
    ORDER BY HISTORYID DESC      
    OFFSET 1 ROWS      
    FETCH NEXT 1 ROWS ONLY;      
      
    DECLARE @HISTORYID INT;      
    SELECT @HISTORYID = HISTORYID FROM #TEMP;      
      
    -- Select the previous and current values for comparison      
    SELECT       
        CASE       
            
		WHEN (FH3.Fia_ex3_75 = @Car_Brand OR @Car_Brand='' OR @Car_Brand IS NULL) AND -- 1. Car Brand      
		     (FH5.Fia_ex5_99 = @Year_Model OR @Year_Model IS NULL) AND -- 2. Year Model      
             (FH1.Fia_ex1_24 = @Term_in_Months OR @Term_in_Months IS NULL OR @Term_in_Months = 0) AND -- 3. Term in Months      
             (FH1.Fia_ex1_22 = @Downpayment_Percentage OR  @Downpayment_Percentage IS NULL OR @Downpayment_Percentage = 0) AND-- 4. Downpayment%    
			 (FH5.Fia_ex5_72 = @Downpayment OR @Downpayment IS NULL OR @Downpayment = 0) AND -- 5. Downpayment      
             (FH3.Fia_ex3_18 = @Amount_Financed_Percentage OR  @Amount_Financed_Percentage IS NULL OR @Amount_Financed_Percentage = 0) AND -- Am FIN%
			 (FH1.Fia_ex1_21 = @Amount_Financed OR  @Amount_Financed IS NULL OR @Amount_Financed = 0) AND -- Amount Financed   
             (FH1.Fia_ex1_25 = @Net_Monthly_Installment  OR @Net_Monthly_Installment IS NULL OR @Net_Monthly_Installment = 0) AND -- Net Monthly Installment
			 (FH1.Fia_ex1_51 = @Total_DI_Percentage  OR @Total_DI_Percentage IS NULL OR @Total_DI_Percentage = 0) AND -- Total DI%             
			 (FH4.Fia_ex4_12 = @Actual_Cash_Out OR @Actual_Cash_Out IS NULL OR @Actual_Cash_Out = 0) AND -- Actual Cash Out      
             ((SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = FH2.Fia_ex2_87) = @Application_Type OR @Application_Type='' OR  @Application_Type IS NULL) AND --AppType      
             (FH2.Fia_ex2_90 = @Account_Source OR @Account_Source='' OR @Account_Source IS NULL) AND -- Account Source      
             ((SELECT TOP 1 VALUE FROM application_type WHERE OWNERID = 985 AND CODE = FH2.Fia_ex2_89) = @Vehicle_Usage OR @Vehicle_Usage='' OR @Vehicle_Usage IS NULL) AND -- Vehicle Usage      
             (FH5.Fia_ex5_124 = @EY OR @EY='' OR @EY IS NULL OR @EY = '0') AND-- EY     
             (FH1.Fia_ex1_137 = @Payment_Mode OR @Payment_Mode='' OR @Payment_Mode IS NULL) AND-- Payment Mode      
             (FH1.Fia_ex1_138 = @Name_Screening_Result OR @Name_Screening_Result='' OR @Name_Screening_Result IS NULL) AND-- Name Screening Result      
             (FH3.Fia_ex3_144 = @Other_Factor OR @Other_Factor='' OR @Other_Factor IS NULL) -- Other Factor      
            THEN 1 -- No changes or current value is NULL      
            ELSE 2 -- Changes detected      
        END AS RESULT      
    FROM      
        FinancialApplicationHistory FH        
        INNER JOIN Fia_ex1_HS FH1 ON FH.OWNERID = FH1.OWNERID AND FH.HISTORYID = FH1.HISTORYID AND FH.CUSTOMOBJECTID = FH1.Fia_ex1_ID             
        INNER JOIN Fia_ex2_HS FH2 ON FH.OWNERID = FH2.OWNERID AND FH.HISTORYID = FH2.HISTORYID AND FH.CUSTOMOBJECTID = FH2.Fia_ex2_ID             
        INNER JOIN Fia_ex3_HS FH3 ON FH.OWNERID = FH3.OWNERID AND FH.HISTORYID = FH3.HISTORYID AND FH.CUSTOMOBJECTID = FH3.Fia_ex3_ID             
        INNER JOIN Fia_ex4_HS FH4 ON FH.OWNERID = FH4.OWNERID AND FH.HISTORYID = FH4.HISTORYID AND FH.CUSTOMOBJECTID = FH4.Fia_ex4_ID             
        INNER JOIN Fia_ex5_HS FH5 ON FH.OWNERID = FH5.OWNERID AND FH.HISTORYID = FH5.HISTORYID AND FH.CUSTOMOBJECTID = FH5.Fia_ex5_ID             
    WHERE      
        FH.OWNERID = 985         
        AND FH.HISTORYID = @HISTORYID         
        --AND FH.CUSTOMOBJECTID = @FA_ID;      
      
    -- Clean up the temporary table      
    DROP TABLE #TEMP;      
END; 
GO



GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MPI_DEALER_NAME]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[MPI_DEALER_NAME]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE MPI_DEALER_NAME  
    @FA_ID INT  
AS  
/*  
CREATED BY : ARYAN SHEKHAR              
CREATED ON : 16-09-2024              
DESCRIPTION: FETCH DEALER NAME                 
EXEC MPI_DEALER_NAME 103770      
*/  
BEGIN  
    DECLARE @Code VARCHAR(10);  
  
    -- Query 1: Fetch the Code from fia_ex3 table using FA_ID  
    SELECT @Code = Fia_ex3_20   
    FROM fia_ex3  
    WHERE fia_ex3_id = @FA_ID;  
  
    -- If the code is found, proceed with the second query  
    IF @Code IS NOT NULL  
    BEGIN  
        -- Query 2: Fetch data from accounts table using the Code retrieved from query 1  
      SELECT Name         FROM accounts         WHERE ownerid = 985          AND Code = @Code;  
    END  
    ELSE  
    BEGIN  
        -- Handle the case where no code was found  
        PRINT 'No code found for the given FA_ID';  
    END  
END;  
GO



GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MPI_CALCULATE_AMOUNT_FINANCED_PERCENTAGE]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[MPI_CALCULATE_AMOUNT_FINANCED_PERCENTAGE]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 
CREATE OR ALTER PROCEDURE [dbo].[MPI_CALCULATE_AMOUNT_FINANCED_PERCENTAGE]  
    @FA_ID INT,  
    @DOWNPAYMENT_PERCENTAGE DECIMAL(13,2)  

AS  
/*  
    CREATED BY: NILABH KUMAR || Modified BY:Aryan Shekhar               
    CREATED ON: 17-09-2024                       
    DETAILS: CALCULATE AMOUNT FINANCED PERCENTAGE ON FA         
    EXEC MPI_CALCULATE_AMOUNT_FINANCED_PERCENTAGE 00103770, 6.03, @AMOUNT_FINANCED_PERCENTAGE OUTPUT  
*/ 
BEGIN  
    -- Calculate the Amount Financed Percentage  

    
    -- Select the result to show inside the procedure
    SELECT 100 - @DOWNPAYMENT_PERCENTAGE AS AmountFinancedPercentage;
END;


GO



GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MPI_UPDATE_AMENDMENT_DETAILS]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[MPI_UPDATE_AMENDMENT_DETAILS]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE MPI_UPDATE_AMENDMENT_DETAILS      
    @FA_ID INT,      
    @Car_Brand NVARCHAR(255),      
    @Car_Model NVARCHAR(255),      
    @Car_Variant_Transmission NVARCHAR(255),      
    @Car_Engine_Type NVARCHAR(255),      
    @Car_Type NVARCHAR(255),      
    @Year_Model INT,      
    @Net_Cash_Price DECIMAL(18, 2),      
    @Term_in_Months INT,      
    @Downpayment_Percentage DECIMAL(5, 2),      
    @Downpayment DECIMAL(18, 2),      
    @Amount_Financed_Percentage DECIMAL(5, 2),      
    @Amount_Financed DECIMAL(18, 2),      
    @Add_On_Rate_Percentage DECIMAL(5, 2),      
    @Net_Monthly_Installment DECIMAL(18, 2),      
    @Actual_Cash DECIMAL(18, 2),      
    @Total_DI_Percentage DECIMAL(5, 2),      
    @Total_Dealer_Incentive DECIMAL(18, 2),      
    @Total_SMC_Percentage DECIMAL(5, 2),      
    @Total_Salesman_Commission DECIMAL(18, 2),      
    @Total_INS_CMF_Percentage DECIMAL(5, 2),      
    @Total_Insurance_Chattel_Fee_PHP DECIMAL(18, 2),      
    @Total_Tuck_Ins_Percentage DECIMAL(5, 2),      
    @NET_Proceeds DECIMAL(18, 2),      
    @Dealer_Subsidy_Percentage DECIMAL(5, 2),      
    @Total_Dealer_Subsidy DECIMAL(18, 2),      
    @INAP_Months INT,      
    @In_Advance_Payment_Amount DECIMAL(18, 2),      
    @Promissory_Note_Amount DECIMAL(18, 2),      
    @Other_Deferred_Credit_Interest DECIMAL(18, 2),      
    @Total_Interest DECIMAL(18, 2),      
    @Prompt_Payment_Discount DECIMAL(18, 2),      
    @Gross_Monthly_Installment DECIMAL(18, 2),      
    @Simple_Interest_Rate DECIMAL(5, 2),      
    @Margin_Of_Finance DECIMAL(5, 2),      
    @EY DECIMAL(5, 2),      
    @IRR DECIMAL(5, 2),      
    @Doc_Stamps_Tax DECIMAL(18, 2),      
    @MOF_NET_DI DECIMAL(18, 2),      
    @Application_Type NVARCHAR(255),      
    @CA_PO NVARCHAR(255),      
    @Account_Source NVARCHAR(255),      
    @Tran_Type NVARCHAR(255),      
    @Dealer_Email NVARCHAR(255),      
    @Vehicle_Condition NVARCHAR(255),      
    @Vehicle_Usage NVARCHAR(255),      
    @Loan_Type NVARCHAR(255),      
    @Promo_Code NVARCHAR(255),      
    @Promo_Name NVARCHAR(255),      
    @Insurance_Type NVARCHAR(255),      
    @Insurance_Type_Amount DECIMAL(18, 2),      
    @Chattel_Fee_Type NVARCHAR(255),      
    @Chattel_Fee_Amount DECIMAL(18, 2),      
    @Dealer_Subsidy_Type NVARCHAR(255),      
    @Dealer_Subsidy_Amount DECIMAL(18, 2),      
    @INAP_Type NVARCHAR(255),      
    @INAP_Amount DECIMAL(18, 2),      
    @Other_Factor NVARCHAR(255),      
    @CRR_Document NVARCHAR(255),      
    @High_Risk_Approval NVARCHAR(255),      
    @Name_Screening_Result NVARCHAR(255),      
    @Payment_Mode NVARCHAR(255),      
 @Dealer_name NVARCHAR(255)      
   -- @ResponseMessage NVARCHAR(1000) OUTPUT -- Added output parameter      
AS      
      
/*=============================================                 
CREATED BY : ARYAN SHEKHAR                  
CREATED ON : 17-09-2024                  
DESCRIPTION: UPDATE AMENDMENTS FOR POST APPROVAL FINALIZATION                      
EXEC MPI_UPDATE_AMENDMENT_DETAILS      
    @FA_ID = 103839,  -- Replace with actual FA_ID      
    @Car_Brand = N'',  -- Example value for Car Brand      
    @Car_Model = N'Corolla',  -- Example value for Car Model      
    @Car_Variant_Transmission = N'Automatic',  -- Example value for Car Variant & Transmission      
    @Car_Engine_Type = N'Gasoline',  -- Example value for Car Engine Type      
    @Car_Type = N'Sedan',  -- Example value for Car Type      
    @Year_Model = 2024,  -- Example value for Year Model      
    @Net_Cash_Price = 1000000,  -- Example value for Net Cash Price      
    @Term_in_Months = 36,  -- Example value for Term in Months      
    @Downpayment_Percentage = 20,  -- Example value for Downpayment Percentage      
    @Downpayment = 200000,  -- Example value for Downpayment      
    @Amount_Financed_Percentage = 80,  -- Example value for Amount Financed Percentage      
    @Amount_Financed = 800000,  -- Example value for Amount Financed      
    @Add_On_Rate_Percentage = 2.5,  -- Example value for Add On Rate Percentage      
    @Net_Monthly_Installment = 25000,  -- Example value for Net Monthly Installment      
    @Actual_Cash = 25000,  -- Example value for Actual Cash      
    @Total_DI_Percentage = 5,  -- Example value for Total Dealer Incentive Percentage      
    @Total_Dealer_Incentive = 50000,  -- Example value for Total Dealer Incentive      
    @Total_SMC_Percentage = 2,  -- Example value for Total SMC Percentage      
    @Total_Salesman_Commission = 20000,  -- Example value for Total Salesman Commission      
    @Total_INS_CMF_Percentage = 1.5,  -- Example value for Total INS-CMF Percentage      
    @Total_Insurance_Chattel_Fee_PHP = 15000,  -- Example value for Total Insurance/Chattel Fee      
    @Total_Tuck_Ins_Percentage = 1,  -- Example value for Total Tuck-Ins Percentage      
    @NET_Proceeds = 750000,  -- Example value for NET Proceeds      
    @Dealer_Subsidy_Percentage = 3,  -- Example value for Dealer Subsidy Percentage      
    @Total_Dealer_Subsidy = 30000,  -- Example value for Total Dealer Subsidy      
    @INAP_Months = 12,  -- Example value for INAP Months      
    @In_Advance_Payment_Amount = 25000,  -- Example value for In Advance Payment Amount      
    @Promissory_Note_Amount = 15000,  -- Example value for Promissory Note Amount      
    @Other_Deferred_Credit_Interest = 10000,  -- Example value for Other Deferred Credit Interest      
    @Total_Interest = 50000,  -- Example value for Total Interest      
    @Prompt_Payment_Discount = 5000,  -- Example value for Prompt Payment Discount      
    @Gross_Monthly_Installment = 30000,  -- Example value for Gross Monthly Installment      
    @Simple_Interest_Rate = 7.5,  -- Example value for Simple Interest Rate      
    @Margin_Of_Finance = 1.5,  -- Example value for Margin of Finance      
    @EY = 5.5,  -- Example value for EY      
    @IRR = 6.5,  -- Example value for IRR      
    @Doc_Stamps_Tax = 1000,  -- Example value for Doc Stamps Tax      
    @MOF_NET_DI = 50000,  -- Example value for MOF NET DI      
    @Application_Type = N'New',  -- Example value for Application Type      
    @CA_PO = N'PO12345',  -- Example value for CA/PO      
    @Account_Source = N'Branch',  -- Example value for Account Source      
    @Tran_Type = N'',  -- Example value for Tran Type      
    @Dealer_Email = N'dealer@example.com',  -- Example value for Dealer Email      
    @Vehicle_Condition = N'New',  -- Example value for Vehicle Condition      
    @Vehicle_Usage = N'Personal',  -- Example value for Vehicle Usage      
    @Loan_Type = N'Car Loan',  -- Example value for Loan Type      
    @Promo_Code = N'PROMO123',  -- Example value for Promo Code      
    @Promo_Name = N'Big Sale',  -- Example value for Promo Name      
    @Insurance_Type = N'Comprehensive',  -- Example value for Insurance Type      
    @Insurance_Type_Amount = 20000,  -- Example value for Insurance Type Amount      
    @Chattel_Fee_Type = N'Fixed',  -- Example value for Chattel Fee Type      
    @Chattel_Fee_Amount = 5000,  -- Example value for Chattel Fee Amount      
    @Dealer_Subsidy_Type = N'Cash',  -- Example value for Dealer Subsidy Type      
    @Dealer_Subsidy_Amount = 15000,  -- Example value for Dealer Subsidy Amount      
    @INAP_Type = N'Fixed',  -- Example value for INAP Type      
    @INAP_Amount = 10000,  -- Example value for INAP Amount      
    @Other_Factor = N'None',  -- Example value for Other Factor      
    @CRR_Document = N'Doc123',  -- Example value for CRR Document      
    @High_Risk_Approval = N'Approved',  -- Example value for High Risk Approval      
    @Name_Screening_Result = N'Clear',  -- Example value for Name Screening Result      
    @Payment_Mode = N'Auto Debit',    
 @Dealer_name=N'';    
     
 ;  -- Example value for Payment Mode      
    @ResponseMessage = @Response OUTPUT;         
           
============================================================*/        
BEGIN      
    -- Default to success      
 DECLARE @ResponseMessage NVARCHAR(100);    
    
    SET @ResponseMessage = 'Update successful';      
      
    -- Update fia_ex3 table      
    UPDATE fia_ex3      
    SET      
        Fia_ex3_75 = CASE WHEN @Car_Brand != '' AND @Car_Brand IS NOT NULL THEN @Car_Brand ELSE Fia_ex3_75 END,      
        Fia_ex3_77 = CASE WHEN @Car_Model != '' AND @Car_Model IS NOT NULL THEN @Car_Model ELSE Fia_ex3_77 END,      
        Fia_ex3_78 = CASE WHEN @Car_Variant_Transmission != '' AND @Car_Variant_Transmission IS NOT NULL THEN @Car_Variant_Transmission ELSE Fia_ex3_78 END,      
        Fia_ex3_79 = CASE WHEN @Car_Engine_Type != '' AND @Car_Engine_Type IS NOT NULL THEN @Car_Engine_Type ELSE Fia_ex3_79 END,      
        Fia_ex3_76 = CASE WHEN @Car_Type != '' AND @Car_Type IS NOT NULL THEN @Car_Type ELSE Fia_ex3_76 END,      
        Fia_ex3_18 = CASE WHEN @Amount_Financed_Percentage != 0 THEN @Amount_Financed_Percentage ELSE Fia_ex3_18 END,      
        Fia_ex3_40 = CASE WHEN @Total_Insurance_Chattel_Fee_PHP != 0 THEN @Total_Insurance_Chattel_Fee_PHP ELSE Fia_ex3_40 END,      
        Fia_ex3_42 = CASE WHEN @Dealer_Subsidy_Percentage != 0 THEN @Dealer_Subsidy_Percentage ELSE Fia_ex3_42 END,      
        Fia_ex3_46 = CASE WHEN @Promissory_Note_Amount != 0 THEN @Promissory_Note_Amount ELSE Fia_ex3_46 END,      
        Fia_ex3_47 = CASE WHEN @Total_Interest != 0 THEN @Total_Interest ELSE Fia_ex3_47 END,      
        Fia_ex3_43 = CASE WHEN @Prompt_Payment_Discount != 0 THEN @Prompt_Payment_Discount ELSE Fia_ex3_43 END,      
        Fia_ex3_44 = CASE WHEN @Gross_Monthly_Installment != 0 THEN @Gross_Monthly_Installment ELSE Fia_ex3_44 END,      
        Fia_ex3_50 = CASE WHEN @Doc_Stamps_Tax != 0 THEN @Doc_Stamps_Tax ELSE Fia_ex3_50 END,      
        Fia_ex3_6 = CASE WHEN @CA_PO != '' AND @CA_PO IS NOT NULL THEN @CA_PO ELSE Fia_ex3_6 END,      
        Fia_ex3_90 = CASE WHEN @INAP_Type != '' AND @INAP_Type IS NOT NULL THEN @INAP_Type ELSE Fia_ex3_90 END,      
        Fia_ex3_91 = CASE WHEN @Insurance_Type != '' AND @Insurance_Type IS NOT NULL THEN @Insurance_Type ELSE Fia_ex3_91 END,      
        Fia_ex3_92 = CASE WHEN @Chattel_Fee_Type != '' AND @Chattel_Fee_Type IS NOT NULL THEN @Chattel_Fee_Type ELSE Fia_ex3_92 END,      
        Fia_ex3_93 = CASE WHEN @Dealer_Subsidy_Type != '' AND @Dealer_Subsidy_Type IS NOT NULL THEN @Dealer_Subsidy_Type ELSE Fia_ex3_93 END, 
		Fia_ex3_94 = CASE WHEN @Promo_Code != '' AND @Promo_Code IS NOT NULL THEN @Promo_Code ELSE Fia_ex3_94 END, 
		Fia_ex3_95= CASE WHEN @Promo_Name != '' AND @Promo_Name IS NOT NULL THEN @Promo_Name ELSE Fia_ex3_95 END,
		Fia_ex3_20 = CASE WHEN @Dealer_name  != '' AND @Dealer_name  IS NOT NULL THEN @Dealer_name  ELSE Fia_ex3_20 END 
    WHERE OWNERID=985 AND fia_ex3_id = @FA_ID;      
      
    -- Check if the last statement failed      
    IF @@ERROR <> 0       
    BEGIN      
        SET @ResponseMessage = 'Error in updating fia_ex3 table';      
        RETURN;      
    END      
      
    -- Update fia_ex1 table      
    UPDATE fia_ex1      
    SET      
        Fia_ex1_20 = CASE WHEN @Net_Cash_Price != 0 THEN @Net_Cash_Price ELSE Fia_ex1_20 END,      
        Fia_ex1_21 = CASE WHEN @Amount_Financed != 0 THEN @Amount_Financed ELSE Fia_ex1_21 END,      
        Fia_ex1_22 = CASE WHEN @Downpayment_Percentage != 0 THEN @Downpayment_Percentage ELSE Fia_ex1_22 END,      
        Fia_ex1_24 = CASE WHEN @Term_in_Months != 0 THEN @Term_in_Months ELSE Fia_ex1_24 END,      
        Fia_ex1_25 = CASE WHEN @Net_Monthly_Installment != 0 THEN @Net_Monthly_Installment ELSE Fia_ex1_25 END,      
        Fia_ex1_46 = CASE WHEN @Add_On_Rate_Percentage != 0 THEN @Add_On_Rate_Percentage ELSE Fia_ex1_46 END,      
        Fia_ex1_47 = CASE WHEN @INAP_Months != 0 THEN @INAP_Months ELSE Fia_ex1_47 END,      
        Fia_ex1_51 = CASE WHEN @Total_DI_Percentage != 0 THEN @Total_DI_Percentage ELSE Fia_ex1_51 END,      
        Fia_ex1_52 = CASE WHEN @Total_SMC_Percentage != 0 THEN @Total_SMC_Percentage ELSE Fia_ex1_52 END,      
        Fia_ex1_53 = CASE WHEN @Total_INS_CMF_Percentage != 0 THEN @Total_INS_CMF_Percentage ELSE Fia_ex1_53 END,      
        Fia_ex1_54 = CASE WHEN @Total_Tuck_Ins_Percentage != 0 THEN @Total_Tuck_Ins_Percentage ELSE Fia_ex1_54 END,      
        Fia_ex1_23 = CASE WHEN @INAP_Amount != 0 THEN @INAP_Amount ELSE Fia_ex1_23 END,      
		Fia_ex1_33 = CASE WHEN @Dealer_Email != '' AND @Dealer_Email IS NOT NULL THEN @Dealer_Email ELSE Fia_ex1_33 END,      
        Fia_ex1_137 = CASE WHEN @Payment_Mode != '' AND @Payment_Mode IS NOT NULL THEN @Payment_Mode ELSE Fia_ex1_137 END,      
        Fia_ex1_138 = CASE WHEN @Name_Screening_Result != '' AND @Name_Screening_Result IS NOT NULL THEN @Name_Screening_Result ELSE Fia_ex1_138 END
	    --Fia_ex1_133 = CASE WHEN @Dealer_name  != '' AND @Dealer_name  IS NOT NULL THEN @Dealer_name  ELSE Fia_ex1_133 END 
    WHERE OWNERID=985 AND fia_ex1_id = @FA_ID;      
      
    -- Check if the last statement failed      
    IF @@ERROR <> 0       
    BEGIN      
        SET @ResponseMessage = 'Error in updating fia_ex1 table';      
        RETURN;      
    END      
      
    -- Update fia_ex4 table      
    UPDATE fia_ex4      
    SET      
        Fia_ex4_12 = CASE WHEN @Actual_Cash != 0 THEN @Actual_Cash ELSE Fia_ex4_12 END,      
        Fia_ex4_39 = CASE WHEN @NET_Proceeds != 0 THEN @NET_Proceeds ELSE Fia_ex4_39 END,      
        Fia_ex4_40 = CASE WHEN @Total_Dealer_Incentive != 0 THEN @Total_Dealer_Incentive ELSE Fia_ex4_40 END,      
       Fia_ex4_41 = CASE WHEN @Total_Salesman_Commission != 0 THEN @Total_Salesman_Commission ELSE Fia_ex4_41 END,      
        Fia_ex4_74 = CASE WHEN @Total_Dealer_Subsidy != 0 THEN @Total_Dealer_Subsidy ELSE Fia_ex4_74 END,      
        Fia_ex4_100 = CASE WHEN @In_Advance_Payment_Amount != 0 THEN @In_Advance_Payment_Amount ELSE Fia_ex4_100 END      
    WHERE OWNERID=985 AND fia_ex4_id = @FA_ID;      
      
    -- Check if the last statement failed      
    IF @@ERROR <> 0       
    BEGIN      
        SET @ResponseMessage = 'Error in updating fia_ex4 table';      
        RETURN;      
    END      
      
    -- Update fia_ex5 table      
    UPDATE fia_ex5      
    SET      
  Fia_ex5_72=CASE WHEN @Downpayment != 0 THEN @Downpayment ELSE Fia_ex5_72 END,      
        Fia_ex5_10 = CASE WHEN @Simple_Interest_Rate != 0 THEN @Simple_Interest_Rate ELSE Fia_ex5_10 END,      
        Fia_ex5_71 = CASE WHEN @MOF_NET_DI != 0 THEN @MOF_NET_DI ELSE Fia_ex5_71 END,      
        Fia_ex5_99 = CASE WHEN @Year_Model != 0 THEN @Year_Model ELSE Fia_ex5_99 END,      
        Fia_ex5_124 = CASE WHEN @EY != 0 THEN @EY ELSE Fia_ex5_124 END,      
        Fia_ex5_128 = CASE WHEN @Margin_Of_Finance != 0 THEN @Margin_Of_Finance ELSE Fia_ex5_128 END      
    WHERE OWNERID=985 AND fia_ex5_id = @FA_ID;      
      
    -- Check if the last statement failed      
    IF @@ERROR <> 0       
    BEGIN      
        SET @ResponseMessage = 'Error in updating fia_ex5 table';      
        RETURN;      
    END      
      
    -- Update fia_ex2 table      
    UPDATE fia_ex2      
    SET      
        Fia_ex2_42 = CASE WHEN @IRR != 0 THEN @IRR ELSE Fia_ex2_42 END,      
        Fia_ex2_87 = CASE WHEN @Application_Type != '' AND @Application_Type IS NOT NULL THEN @Application_Type ELSE Fia_ex2_87 END,      
        Fia_ex2_88 = CASE WHEN @Loan_Type != '' AND @Loan_Type IS NOT NULL THEN @Loan_Type ELSE Fia_ex2_88 END,      
        Fia_ex2_89 = CASE WHEN @Vehicle_Usage != '' AND @Vehicle_Usage IS NOT NULL THEN @Vehicle_Usage ELSE Fia_ex2_89 END,      
        Fia_ex2_90 = CASE WHEN @Account_Source != '' AND @Account_Source IS NOT NULL THEN @Account_Source ELSE Fia_ex2_90 END,      
        Fia_ex2_91 = CASE WHEN @Vehicle_Condition != '' AND @Vehicle_Condition IS NOT NULL THEN @Vehicle_Condition ELSE Fia_ex2_91 END,      
        Fia_ex2_92 = CASE WHEN @Tran_Type != '' AND @Tran_Type IS NOT NULL THEN @Tran_Type ELSE Fia_ex2_92 END      
    WHERE OWNERID=985 AND fia_ex2_id = @FA_ID;      
      
    -- Check if the last statement failed      
    IF @@ERROR <> 0       
    BEGIN      
        SET @ResponseMessage = 'Error in updating fia_ex2 table';      
        RETURN;      
    END      
      
    -- If all updates were successful, return success      
    SET @ResponseMessage = 'All updates successful';      
    
 SELECT @ResponseMessage AS RESPONSEMESSAGE;    
END; 
GO


INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6444,363,N'response',N'response',N'HTML',0,0,0,N'',N'Mr. Aryan Shekhar','2024-09-19 05:34:54',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6452,365,N'COMPUTEDDSCR',N'COMPUTEDDSCR',N'Float',0,0,0,N'',N'Mr. Aryan Shekhar','2024-08-30 10:23:41',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6453,365,N'COMPUTEDAPPSCORE',N'COMPUTEDAPPSCORE',N'String',0,0,0,N'',N'Mr. Aryan Shekhar','2024-08-30 10:23:41',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6454,365,N'COMPUTEDGREENLAN',N'COMPUTEDGREENLAN',N'Integer',0,0,0,N'',N'Mr. Aryan Shekhar','2024-08-30 10:23:41',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6490,366,N'RESULT',N'RESULT',N'Integer',0,0,0,N'',N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6491,367,N'Name',N'Name',N'String',0,0,0,N'',N'Mr. Aryan Shekhar','2024-09-16 08:41:08',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6492,368,N'AmountFinancedPercentage',N'AmountFinancedPercentage',N'String',0,0,0,N'',N'Mr. Aryan Shekhar','2024-09-17 10:32:53',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
INSERT INTO [dbo].[MashupDataSourceField] (OwnerId,FieldId,DataSourceId,Name,Label,Type,IsSearchable,IsFilterable,IsDisplay,XPath,AddedBy,AddedOn,format,MaskStartPos,MaskTotalChar,MaskChar,ApplyMaskOnNewEdit,ContentNameField,ContentTypeField,IsCastRequired,OutParameterIndex,MaskFormatId,EDSResolverId,GroupID,GroupName,ParentGroupID,MaxLength,AdditionalSettings) VALUES(985,6493,369,N'RESPONSEMESSAGE',N'RESPONSEMESSAGE',N'String',0,0,0,N'',N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',-1,-1,N'*',0,N'',N'',Null,Null,-1,-1,0,N'',0,-1,N'{"MongoOutputFieldMode":3}')
Set identity_insert dbo.MashupParamMapping On 
INSERT INTO [dbo].[MashupParamMapping] (OwnerID,MappingID,DataSourceId,MappingXml,CreatedBy,CreatedOn) VALUES(985,5719,365,N'<mappings><mapping parametername=''FAID'' mappedcolumn=''InputParam1'' /><mapping parametername=''NEWNMI'' mappedcolumn=''InputParam2'' /></mappings>',1,'2024-08-30 10:23:41')
 Set identity_insert dbo.MashupParamMapping OFF
Set identity_insert dbo.MashupParamMapping On 
INSERT INTO [dbo].[MashupParamMapping] (OwnerID,MappingID,DataSourceId,MappingXml,CreatedBy,CreatedOn) VALUES(985,5732,366,N'<mappings><mapping parametername=''FA_ID'' mappedcolumn=''InputParam1'' /><mapping parametername=''Car_Brand'' mappedcolumn=''InputParam2'' /><mapping parametername=''Year_Model'' mappedcolumn=''InputParam3'' /><mapping parametername=''Term_in_Months'' mappedcolumn=''InputParam4'' /><mapping parametername=''Downpayment_Percentage'' mappedcolumn=''InputParam5'' /><mapping parametername=''Downpayment'' mappedcolumn=''InputParam6'' /><mapping parametername=''Amount_Financed_Percentage'' mappedcolumn=''InputParam7'' /><mapping parametername=''Amount_Financed'' mappedcolumn=''InputParam8'' /><mapping parametername=''Net_Monthly_Installment'' mappedcolumn=''InputParam9'' /><mapping parametername=''Total_DI_Percentage'' mappedcolumn=''InputParam10'' /><mapping parametername=''Application_Type'' mappedcolumn=''InputParam11'' /><mapping parametername=''Account_Source'' mappedcolumn=''InputParam12'' /><mapping parametername=''Vehicle_Usage'' mappedcolumn=''InputParam13'' /><mapping parametername=''Actual_Cash_Out'' mappedcolumn=''InputParam14'' /><mapping parametername=''EY'' mappedcolumn=''InputParam15'' /><mapping parametername=''Payment_Mode'' mappedcolumn=''InputParam16'' /><mapping parametername=''Name_Screening_Result'' mappedcolumn=''InputParam17'' /><mapping parametername=''Other_Factor'' mappedcolumn=''InputParam18'' /></mappings>',1,'2024-09-13 06:50:42')
 Set identity_insert dbo.MashupParamMapping OFF
Set identity_insert dbo.MashupParamMapping On 
INSERT INTO [dbo].[MashupParamMapping] (OwnerID,MappingID,DataSourceId,MappingXml,CreatedBy,CreatedOn) VALUES(985,5736,369,N'<mappings><mapping parametername=''FA_ID'' mappedcolumn=''InputParam1'' /><mapping parametername=''Car_Brand'' mappedcolumn=''InputParam2'' /><mapping parametername=''Car_Model'' mappedcolumn=''InputParam3'' /><mapping parametername=''Car_Variant_Transmission'' mappedcolumn=''InputParam4'' /><mapping parametername=''Car_Engine_Type'' mappedcolumn=''InputParam5'' /><mapping parametername=''Car_Type'' mappedcolumn=''InputParam6'' /><mapping parametername=''Year_Model'' mappedcolumn=''InputParam7'' /><mapping parametername=''Net_Cash_Price'' mappedcolumn=''InputParam8'' /><mapping parametername=''Term_in_Months'' mappedcolumn=''InputParam9'' /><mapping parametername=''Downpayment_Percentage'' mappedcolumn=''InputParam10'' /><mapping parametername=''Downpayment'' mappedcolumn=''InputParam11'' /><mapping parametername=''Amount_Financed_Percentage'' mappedcolumn=''InputParam12'' /><mapping parametername=''Amount_Financed'' mappedcolumn=''InputParam13'' /><mapping parametername=''Add_On_Rate_Percentage'' mappedcolumn=''InputParam14'' /><mapping parametername=''Net_Monthly_Installment'' mappedcolumn=''InputParam15'' /><mapping parametername=''Actual_Cash'' mappedcolumn=''InputParam16'' /><mapping parametername=''Total_DI_Percentage'' mappedcolumn=''InputParam17'' /><mapping parametername=''Total_Dealer_Incentive'' mappedcolumn=''InputParam18'' /><mapping parametername=''Total_SMC_Percentage'' mappedcolumn=''InputParam19'' /><mapping parametername=''Total_Salesman_Commission'' mappedcolumn=''InputParam20'' /><mapping parametername=''Total_INS_CMF_Percentage'' mappedcolumn=''InputParam21'' /><mapping parametername=''Total_Insurance_Chattel_Fee_PHP'' mappedcolumn=''InputParam22'' /><mapping parametername=''Total_Tuck_Ins_Percentage'' mappedcolumn=''InputParam23'' /><mapping parametername=''NET_Proceeds'' mappedcolumn=''InputParam24'' /><mapping parametername=''Dealer_Subsidy_Percentage'' mappedcolumn=''InputParam25'' /><mapping parametername=''Total_Dealer_Subsidy'' mappedcolumn=''InputParam26'' /><mapping parametername=''INAP_Months'' mappedcolumn=''InputParam27'' /><mapping parametername=''In_Advance_Payment_Amount'' mappedcolumn=''InputParam28'' /><mapping parametername=''Promissory_Note_Amount'' mappedcolumn=''InputParam29'' /><mapping parametername=''Other_Deferred_Credit_Interest'' mappedcolumn=''InputParam30'' /><mapping parametername=''Total_Interest'' mappedcolumn=''InputParam31'' /><mapping parametername=''Prompt_Payment_Discount'' mappedcolumn=''InputParam32'' /><mapping parametername=''Gross_Monthly_Installment'' mappedcolumn=''InputParam33'' /><mapping parametername=''Simple_Interest_Rate'' mappedcolumn=''InputParam34'' /><mapping parametername=''Margin_Of_Finance'' mappedcolumn=''InputParam35'' /><mapping parametername=''EY'' mappedcolumn=''InputParam36'' /><mapping parametername=''IRR'' mappedcolumn=''InputParam37'' /><mapping parametername=''Doc_Stamps_Tax'' mappedcolumn=''InputParam38'' /><mapping parametername=''MOF_NET_DI'' mappedcolumn=''InputParam39'' /><mapping parametername=''Application_Type'' mappedcolumn=''InputParam40'' /><mapping parametername=''CA_PO'' mappedcolumn=''InputParam41'' /><mapping parametername=''Account_Source'' mappedcolumn=''InputParam42'' /><mapping parametername=''Tran_Type'' mappedcolumn=''InputParam43'' /><mapping parametername=''Dealer_Email'' mappedcolumn=''InputParam44'' /><mapping parametername=''Vehicle_Condition'' mappedcolumn=''InputParam45'' /><mapping parametername=''Vehicle_Usage'' mappedcolumn=''InputParam46'' /><mapping parametername=''Loan_Type'' mappedcolumn=''InputParam47'' /><mapping parametername=''Promo_Code'' mappedcolumn=''InputParam48'' /><mapping parametername=''Promo_Name'' mappedcolumn=''InputParam49'' /><mapping parametername=''Insurance_Type'' mappedcolumn=''InputParam50'' /><mapping parametername=''Insurance_Type_Amount'' mappedcolumn=''InputParam51'' /><mapping parametername=''Chattel_Fee_Type'' mappedcolumn=''InputParam52'' /><mapping parametername=''Chattel_Fee_Amount'' mappedcolumn=''InputParam53'' /><mapping parametername=''Dealer_Subsidy_Type'' mappedcolumn=''InputParam54'' /><mapping parametername=''Dealer_Subsidy_Amount'' mappedcolumn=''InputParam55'' /><mapping parametername=''INAP_Type'' mappedcolumn=''InputParam56'' /><mapping parametername=''INAP_Amount'' mappedcolumn=''InputParam57'' /><mapping parametername=''Other_Factor'' mappedcolumn=''InputParam58'' /><mapping parametername=''CRR_Document'' mappedcolumn=''InputParam59'' /><mapping parametername=''High_Risk_Approval '' mappedcolumn=''InputParam60'' /><mapping parametername=''Name_Screening_Result'' mappedcolumn=''InputParam61'' /><mapping parametername=''Payment_Mode'' mappedcolumn=''InputParam62'' /><mapping parametername=''Dealer_name'' mappedcolumn=''InputParam63'' /></mappings>',1,'2024-09-17 13:01:35')
 Set identity_insert dbo.MashupParamMapping OFF
Set identity_insert dbo.MashupParamMapping On 
INSERT INTO [dbo].[MashupParamMapping] (OwnerID,MappingID,DataSourceId,MappingXml,CreatedBy,CreatedOn) VALUES(985,5739,363,N'<mappings><mapping parametername=''FA_ID'' mappedcolumn=''InputParam1'' /><mapping parametername=''AMENDMENT_ID'' mappedcolumn=''InputParam2'' /></mappings>',1,'2024-09-19 05:34:54')
 Set identity_insert dbo.MashupParamMapping OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,363,N'AMENDMENT_ID',N'Integer',0,N'Mr. Aryan Shekhar','2024-09-19 05:34:54',N'',9924,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,363,N'FA_ID',N'Integer',0,N'Mr. Aryan Shekhar','2024-09-19 05:34:54',N'',9923,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,365,N'FAID',N'Integer',0,N'Mr. Aryan Shekhar','2024-08-30 10:23:41',N'',9616,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,365,N'NEWNMI',N'Decimal',0,N'Mr. Aryan Shekhar','2024-08-30 10:23:41',N'',9617,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Account_Source',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9643,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Actual_Cash_Out',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9645,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Amount_Financed',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9639,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Amount_Financed_Percentage',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9638,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Application_Type',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9642,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Car_Brand',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9633,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Downpayment',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9637,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Downpayment_Percentage',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9636,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'EY',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9646,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'FA_ID',N'Integer',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9632,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Name_Screening_Result',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9648,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Net_Monthly_Installment',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9640,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Other_Factor',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9649,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Payment_Mode',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9647,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Term_in_Months',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9635,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Total_DI_Percentage',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9641,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Vehicle_Usage',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9644,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,366,N'Year_Model',N'String',0,N'Mr. Aryan Shekhar','2024-09-13 06:50:42',N'',9634,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,367,N'FA_ID',N'Integer',0,N'Mr. Aryan Shekhar','2024-09-16 08:41:08',N'',9651,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,368,N'DOWNPAYMENT_PERCENTAGE',N'Decimal',0,N'Mr. Aryan Shekhar','2024-09-17 10:32:53',N'',9725,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,368,N'FA_ID',N'Integer',0,N'Mr. Aryan Shekhar','2024-09-17 10:32:53',N'',9724,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Account_Source',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9893,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Actual_Cash',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9867,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Add_On_Rate_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9865,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Amount_Financed',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9864,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Amount_Financed_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9863,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Application_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9891,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'CA_PO',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9892,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Car_Brand',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9853,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Car_Engine_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9856,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Car_Model',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9854,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Car_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9857,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Car_Variant_Transmission',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9855,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Chattel_Fee_Amount',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9904,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Chattel_Fee_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9903,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'CRR_Document',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9910,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Dealer_Email',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9895,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Dealer_name',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9914,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Dealer_Subsidy_Amount',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9906,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Dealer_Subsidy_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9876,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Dealer_Subsidy_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9905,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Doc_Stamps_Tax',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9889,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Downpayment',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9862,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Downpayment_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9861,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'EY',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9887,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'FA_ID',N'Integer',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9852,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Gross_Monthly_Installment',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9884,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'High_Risk_Approval ',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9911,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'In_Advance_Payment_Amount',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9879,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'INAP_Amount',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9908,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'INAP_Months',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9878,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'INAP_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9907,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Insurance_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9901,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Insurance_Type_Amount',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9902,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'IRR',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9888,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Loan_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9898,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Margin_Of_Finance',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9886,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'MOF_NET_DI',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9890,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Name_Screening_Result',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9912,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Net_Cash_Price',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9859,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Net_Monthly_Installment',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9866,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'NET_Proceeds',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9875,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Other_Deferred_Credit_Interest',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9881,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Other_Factor',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9909,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Payment_Mode',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9913,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Promissory_Note_Amount',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9880,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Promo_Code',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9899,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Promo_Name',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9900,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Prompt_Payment_Discount',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9883,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Simple_Interest_Rate',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9885,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Term_in_Months',N'Integer',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9860,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_Dealer_Incentive',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9869,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_Dealer_Subsidy',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9877,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_DI_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9868,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_INS_CMF_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9872,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_Insurance_Chattel_Fee_PHP',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9873,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_Interest',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9882,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_Salesman_Commission',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9871,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_SMC_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9870,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Total_Tuck_Ins_Percentage',N'Decimal',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9874,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Tran_Type',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9894,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Vehicle_Condition',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9896,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Vehicle_Usage',N'String',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9897,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF
Set identity_insert dbo.MashupQueryParameter On 
INSERT INTO [dbo].[MashupQueryParameter] (OwnerId,DataSourceId,Name,Type,IsMandatory,AddedBy,AddedOn,Template,ParameterOrder,DisplayName,TemplateProperties,ParamProperties,IsCollection,IsEnum,IsHeaderProperty,ArrayTemplateID,ArrayTemplateName,ParentId) VALUES(985,369,N'Year_Model',N'Integer',0,N'Mr. Aliasger baji','2024-09-17 13:01:35',N'',9858,N'',N'',N'',0,0,0,0,Null,0)
 Set identity_insert dbo.MashupQueryParameter OFF


Update MashupIdList Set LastId = t.MaxId from  (select OwnerID, max ( datasourceid ) as MaxId from dbo.MashupDataSource Group by OwnerID) as t Where  MashupIdList.ItemId = 2   and t.OwnerID =MashupIdList.OwnerID    
Update MashupIdList Set LastId = t.MaxId from  (select OwnerID, max ( FieldId ) as MaxId from dbo.MashupDataSourceField Group by OwnerID) as t Where  MashupIdList.ItemId =3   and t.OwnerID =MashupIdList.OwnerID;

Update DataSourceXslt SET LastModifiedBy = 1 Where OwnerID = 985 ;
Update MashupDataSource SET CreatedBy = 1,LastModifiedBy = 1 Where OwnerID = 985 ;
Update MashupParamMapping SET CreatedBy = 1 Where OwnerID = 985 ;

---------SP
CREATE OR ALTER PROCEDURE MPI_GET_RECOMPUTED_AMENDMENTS_APPSCORE   
(                  
    @IN_FAID INT,    
    @IN_COMPUTED_DSCR DECIMAL(10,2),    
    @NEWCOMPUTED_APPSCORE INT OUT,  -- Change the type to INT for the direct app score  
    -- Other output variables  
    @RET_AGE INT OUT,          
    @RET_AGESCORE INT OUT,          
    @RET_PRV NVARCHAR(15) OUT,          
    @RET_PROVINCESCORE INT OUT,          
    @RET_PROFESSION NVARCHAR(10) OUT,          
    @RET_PROFESSIONSCORE INT OUT,                  
    @RET_NOB INT OUT,          
    @RET_NOBSCORE INT OUT,                  
    @RET_DSCR DECIMAL(10,2) OUT,          
    @RET_DSCRSCORE INT OUT,                  
    @RET_LT INT OUT,          
    @RET_LOANTERMSCORE INT OUT,          
    @RET_MOF INT OUT,          
    @RET_MOFSCORE INT OUT,                  
    @RET_TOTALDI DECIMAL(16,6) OUT,          
    @RET_TOTALDISCORE INT OUT,                  
    @RET_CRBRND  NVARCHAR(20) OUT,          
    @RET_CRBRNDSCORE INT OUT,                  
    @RET_AG058S DECIMAL(16,6) OUT,          
    @RET_AG058SSCORE INT OUT,                  
    @RET_MOB INT OUT,          
    @RET_MOBSCORE INT OUT,                  
    @RET_UTIL_RATE  DECIMAL(16,6) OUT,          
    @RET_UTILSCORE INT OUT,                  
    @RET_SCORE INT OUT,                   
    @RET_SB INT OUT,        
    @RET_SCORINGMETHOD NVARCHAR(15) OUT,        
    @RET_ASCORE NVARCHAR(10) OUT     
)                  
AS    
/*==================================================================================      
Description: Calculates app score through widget.                  
  Created By: Pradyuman Sharma | Created On: 22nd February 2024                  
  MPI_CALC_APP_SCORE_INPUTS 0,'65','A002',60.0,'TOYOTA',5,'MET',99813,2.50,12,1,0.0,0.0;                
==========================================================================================*/    
BEGIN           
    
    DECLARE @TAS            INT = 0,                            
            @SB             INT = 0,           
            @MOF            INT = 0,           
            @MOB            INT = 0,          
            @SCORE          INT = 0,                      
            @FAID           INT = 0,          
            @NOB            INT = 0,                            
            @DSCR           INT = 0,                            
            @LT             INT = 0,          
            @TOTALDI        DECIMAL(16,6),                
            @UTIL_RATE      DECIMAL(16,6),                
            @AG058S         DECIMAL(16,6),          
            @TYPE           NVARCHAR(5),                                             
            @CRBRND         NVARCHAR(20),                            
            @PRV            NVARCHAR(15),           
            @ASCORE         NVARCHAR(10),          
            @EMPLOYMENTCODE NVARCHAR(10);       
       
    DECLARE @TRIGTYPE INT=2;    
    DECLARE @PRIMARY_APP_ID INT;    
  
    -- Fetch primary application ID  
    SELECT @PRIMARY_APP_ID = APPLICATIONID   
    FROM APPLICATION A    
    INNER JOIN APL_ex1 A1   
        ON A.OWNERID = A1.OWNERID   
        AND A.APPLICATIONID = A1.APL_ex1_ID    
    WHERE A.OWNERID = 985   
        AND A.RELATEDTOTYPEID = 100286   
        AND A.RELATEDTOID = @IN_FAID   
        AND A1.APL_EX1_53 = 'P';    
    
    DECLARE @IN_PROFESSION NVARCHAR(10);    
    SELECT @IN_PROFESSION = APL_ex2_31   
    FROM APL_ex2   
    WHERE OWNERID = 985   
        AND APL_ex2_ID = @PRIMARY_APP_ID;    
    
    DECLARE @IN_TU_CHECK INT, @IN_AGE INT;    
    SELECT @IN_TU_CHECK = APL_ex5_45, @IN_AGE = APL_ex5_40   
    FROM APL_ex5   
    WHERE OWNERID = 985   
        AND APL_ex5_ID = @PRIMARY_APP_ID;    
    
    -- Application data fetch  
    SELECT   
        @FAID = A.RELATEDTOID,                
        @PRV = S.STATECODE,                
        @NOB = A3.APL_EX3_99,                
        @DSCR = @IN_COMPUTED_DSCR,               
        @MOB = APL_EX5_90,          
        @EMPLOYMENTCODE = Apl_ex2_30,          
        @AG058S = Apl_ex5_65,          
        @UTIL_RATE = Apl_ex5_57          
    FROM APPLICATION (NOLOCK) A                
    INNER JOIN APL_EX1 (NOLOCK) A1                
        ON A.OWNERID = A1.OWNERID   
        AND A.APPLICATIONID = A1.APL_EX1_ID                
    INNER JOIN APL_EX2 (NOLOCK) A2                
        ON A.OWNERID = A2.OWNERID   
        AND A.APPLICATIONID = A2.APL_EX2_ID                
    INNER JOIN APL_EX3 (NOLOCK) A3         
        ON A.OWNERID = A3.OWNERID   
        AND A.APPLICATIONID = A3.APL_EX3_ID                
    INNER JOIN APL_EX4 (NOLOCK) A4           
        ON A.OWNERID = A4.OWNERID   
        AND A.APPLICATIONID = A4.APL_EX4_ID               
    INNER JOIN STATES (NOLOCK) S          
        ON S.OWNERID = A4.OWNERID   
        AND S.NAME = A4.APL_EX4_4              
    INNER JOIN APL_EX5 (NOLOCK) A5                
        ON A.OWNERID = A5.OWNERID   
        AND A.APPLICATIONID = A5.APL_EX5_ID                
    WHERE A.OWNERID = 985   
        AND A.APPLICATIONID = @PRIMARY_APP_ID;         
              
    -- Financial application data fetch  
    SELECT   
        @MOF = F5.FIA_EX5_71,                
        @LT = F1.FIA_EX1_24,                
        @TOTALDI = F1.FIA_EX1_51,          
        @CRBRND = F3.Fia_ex3_75          
    FROM FINANCIALAPPLICATION (NOLOCK) FA                
    INNER JOIN FIA_EX1 (NOLOCK) F1                
        ON FA.OWNERID = F1.OWNERID   
        AND FA.CUSTOMOBJECTID = F1.FIA_EX1_ID                
    INNER JOIN FIA_EX2 (NOLOCK) F2                
        ON FA.OWNERID = F2.OWNERID   
        AND FA.CUSTOMOBJECTID = F2.FIA_EX2_ID                
    INNER JOIN FIA_EX3 (NOLOCK) F3                
        ON FA.OWNERID = F3.OWNERID   
        AND FA.CUSTOMOBJECTID = F3.FIA_EX3_ID                
    INNER JOIN FIA_EX4 (NOLOCK) F4                
        ON FA.OWNERID = F4.OWNERID   
        AND FA.CUSTOMOBJECTID = F4.FIA_EX4_ID                
    INNER JOIN FIA_EX5 (NOLOCK) F5                
        ON FA.OWNERID = F5.OWNERID   
        AND FA.CUSTOMOBJECTID = F5.FIA_EX5_ID                
    WHERE FA.OWNERID = 985   
        AND FA.CUSTOMOBJECTID = @IN_FAID;      
  
    DECLARE @SCORINGMETHOD NVARCHAR(15);          
    IF (@TRIGTYPE = 2)          
    BEGIN          
        SET @MOF = @MOF;                  
        SET @TOTALDI = @TOTALDI;                  
        SET @UTIL_RATE = @UTIL_RATE;            
    END          
    ELSE          
    BEGIN          
        SET @MOF = @MOF / 100;                  
        SET @TOTALDI = @TOTALDI / 100;                
        SET @UTIL_RATE = @UTIL_RATE / 100;            
    END;            
  
    -- Scores calculation logic...  
    DECLARE @AGESCORE INT = 0,                  
            @PROVINCESCORE INT = 0,                  
            @PROFESSIONSCORE INT = 0,                  
            @NOBSCORE INT = 0,                  
            @DSCRSCORE INT = 0,                  
            @LOANTERMSCORE INT = 0,                  
            @MOFSCORE INT = 0,                  
            @TOTALDISCORE INT = 0,                  
            @CRBRNDSCORE INT = 0,                  
            @AG058SSCORE INT = 0,                  
            @UTILSCORE INT = 0,                  
            @MOBSCORE INT = 0;                  
  
    IF (@MOB >= 6 AND @IN_TU_CHECK = 200)                  
    BEGIN                  
        SET @TYPE = N'BG1';                  
    END                  
    ELSE                  
    BEGIN                  
        SET @TYPE = N'NG2';                  
    END;                  
  
    IF (@TYPE = N'NG2')                   
    BEGIN                      
        SELECT @SCORE = ISNULL(SCORENG2, 0)   
        FROM MPI_MDM_AGE_NG2 (NOLOCK)   
        WHERE @IN_AGE >= AGEMINNG2   
            AND @IN_AGE <= AGEMAXNG2;                  
        SET @AGESCORE = @SCORE;  
                        
        SELECT @SCORE = @SCORE + ISNULL(SCORE, 0)   
        FROM MPI_MDM_PROVINCE_REGSCOR (NOLOCK)   
        WHERE PROVINCECODE = @PRV;    
        SET @PROVINCESCORE = @SCORE;  
                        
        SELECT @SCORE = @SCORE + ISNULL(SCORENG2, 0)   
        FROM MPI_MDM_PROFESSION (NOLOCK)   
        WHERE CODE = @IN_PROFESSION;                  
        SET @PROFESSIONSCORE = @SCORE;  
                        
        SELECT TOP 1 @SCORE = @SCORE + ISNULL(ScoreNG2, 0)   
        FROM MPI_MDM_NatureOfBusiness (NOLOCK)   
        WHERE SIBSCODE = @NOB;                  
        SET @NOBSCORE = @SCORE;  
                        
        SELECT @SCORE = @SCORE + ISNULL(SCORENG2, 0)   
        FROM MPI_MDM_ADJUSTEDDSCR (NOLOCK)   
        WHERE @DSCR >= ADJUSTEDDSCRMIN   
            AND @DSCR <= ADJUSTEDDSCRMAX;                  
        SET @DSCRSCORE = @SCORE;  
                          
        SELECT @SCORE = @SCORE + ISNULL(SCORENG2, 0)   
        FROM MPI_MDM_LOANTERMNGTWO (NOLOCK)   
        WHERE OWNERID = 985   
            AND @LT >= LOANTERMMIN   
            AND @LT <= LOANTERMMAX;                  
        SET @LOANTERMSCORE = @SCORE;  
                        
        SELECT @SCORE = @SCORE + ISNULL(SCORENG2, 0)   
        FROM MPI_MDM_MOF_NETDINGTWO (NOLOCK)   
        WHERE OWNERID = 985   
            AND @MOF >= CONVERT(DECIMAL(16,6), MOFNETDIMINNG2)   
            AND @MOF <= CONVERT(DECIMAL(16,6), MOFNETDIMAXNG2);                  
        SET @MOFSCORE = @SCORE;  
                        
        SELECT TOP 1 @SCORE = @SCORE + ISNULL(SCORENG2, 0)   
        FROM MPI_MDM_DI_RATE_NG2 (NOLOCK)   
        WHERE OWNERID = 985   
            AND @TOTALDI >= CONVERT(DECIMAL(16,6), TotalDIRateMinNG2)   
            AND @TOTALDI <= CONVERT(DECIMAL(16,6), TotalDIRateMaxNG2);              
        SET @TOTALDISCORE = @SCORE;  
                      
        SELECT @SCORE = @SCORE + ISNULL(Score, 0)   
        FROM MPI_MDM_VEHICLECARBRAND (NOLOCK)   
        WHERE OWNERID = 985   
            AND VEHICLECARBRAND = @CRBRND;                  
        SET @CRBRNDSCORE = @SCORE;  
                        
        SELECT @ASCORE = ASCORE_DECISION   
        FROM MPI_MDM_NG2_SCOREBAND (NOLOCK)   
        WHERE OWNERID = 985   
            AND @SCORE >= TOTALSCOREMIN   
            AND @SCORE <= TOTALSCOREMAX;  
                        
        SELECT @SB = SCOREBAND   
        FROM MPI_MDM_NG2_SCOREBAND (NOLOCK)   
        WHERE OWNERID = 985   
            AND @SCORE >= TOTALSCOREMIN   
            AND @SCORE <= TOTALSCOREMAX;  
    END                  
    ELSE                  
    BEGIN                  
        SELECT @SCORE = ISNULL(ScoreBG1, 0)   
        FROM MPI_MDM_AGE_NG2 (NOLOCK)   
        WHERE OWNERID = 985   
            AND @IN_AGE >= AgeMinBG1   
            AND @IN_AGE <= AgeMaxBG1;                  
        SET @AGESCORE = @SCORE;  
                        
        IF(@IN_PROFESSION = 'B015')                        
        BEGIN                        
            SELECT @SCORE = @SCORE + ISNULL(SCORE, 0)   
            FROM MPI_MDM_PROFNOB_BG1   
            WHERE PROFESSIONCODE = @IN_PROFESSION   
                AND NOBCode = @NOB;                        
        END                        
        ELSE                        
        BEGIN                        
            SELECT @SCORE = @SCORE + ISNULL(SCORE, 0)   
            FROM MPI_MDM_PROFNOB_BG1   
            WHERE PROFESSIONCODE = @IN_PROFESSION;                  
        END;                        
        SELECT @PROFESSIONSCORE = @SCORE;  
                        
        SELECT @SCORE = @SCORE + ISNULL(SCOREBG1, 0)   
        FROM MPI_MDM_NET_DI_BG1 (NOLOCK)   
        WHERE @MOF >= CONVERT(DECIMAL(16,6), MOFNETDIMINBG1)   
            AND @MOF <= CONVERT(DECIMAL(16,6), MOFNETDIMAXBG1);                  
        SET @MOFSCORE = @SCORE;                  
                        
        SELECT @SCORE = @SCORE + ISNULL(ScoreBG1, 0)   
        FROM MPI_MDM_VEHICLECARBRAND (NOLOCK)   
        WHERE VEHICLECARBRAND = @CRBRND;                  
        SET @CRBRNDSCORE = @SCORE;                  
                        
        IF (@AG058S = 0)          
        BEGIN                  
            SET @SCORE = @SCORE + 131;                  
        END                  
        ELSE IF (@AG058S = 1)                  
        BEGIN                  
            SET @SCORE = @SCORE + 63;                  
        END                  
        ELSE                  
        BEGIN                  
            SET @SCORE = @SCORE + 42;                  
        END;                  
        SET @AG058SSCORE = @SCORE;  
                        
        SELECT @SCORE = @SCORE + ISNULL(SCORE, 0)   
        FROM MPI_MDM_TUMAX_MOB_BG1 (NOLOCK)   
        WHERE @MOB BETWEEN MOBMINBG1 AND MOBMAXBG1;                  
        SET @MOBSCORE = @SCORE;                                    
                        
        SELECT @SCORE = @SCORE + ISNULL(SCORE, 0)   
        FROM MPI_MDM_TU_UTIL_RATE (NOLOCK)   
        WHERE @UTIL_RATE >= CONVERT(DECIMAL(16,6), UTILMIN)   
            AND @UTIL_RATE <= CONVERT(DECIMAL(16,6), UTILMAX);                  
        SET @UTILSCORE = @SCORE;                  
                        
        SELECT @SB = SCOREBANDBG1   
        FROM MPI_MDM_BG1SCOREBAND (NOLOCK)   
        WHERE @SCORE BETWEEN TOTALSCOREMINBG1   
            AND TOTALSCOREMAXBG1;  
                        
        SELECT @AScore = ASCORE_DECISION   
        FROM MPI_MDM_BG1ScoreBand (NOLOCK)   
        WHERE @SCORE >= TotalScoreMinBG1   
            AND @SCORE <= TotalScoreMaxBG1;                                  
    END;                  
  
    -- Set @NEWCOMPUTED_APPSCORE as the final calculated score  
    SET @NEWCOMPUTED_APPSCORE = @SCORE;  
  
    -- Assign computed values to other output parameters  
    SELECT   
        @RET_AGE=@IN_AGE,          
        @RET_AGESCORE=@AGESCORE,          
        @RET_PRV=@PRV,          
        @RET_PROVINCESCORE=@PROVINCESCORE,          
        @RET_PROFESSION=@IN_PROFESSION,          
        @RET_PROFESSIONSCORE=@PROFESSIONSCORE,                  
        @RET_NOB=@NOB,          
        @RET_NOBSCORE=@NOBSCORE,                  
        @RET_DSCR=@DSCR,          
        @RET_DSCRSCORE=@DSCRSCORE,                  
        @RET_LT=@LT,          
        @RET_LOANTERMSCORE=@LOANTERMSCORE,          
        @RET_MOF=@MOF,          
        @RET_MOFSCORE=@MOFSCORE,                  
        @RET_TOTALDI=@TOTALDI,          
        @RET_TOTALDISCORE=@TOTALDISCORE,                  
        @RET_CRBRND=@CRBRND,          
        @RET_CRBRNDSCORE=@CRBRNDSCORE,                  
        @RET_AG058S=@AG058S,          
        @RET_AG058SSCORE=@AG058SSCORE,                  
        @RET_MOB=@MOB,          
        @RET_MOBSCORE=@MOBSCORE,                  
        @RET_UTIL_RATE=@UTIL_RATE,          
        @RET_UTILSCORE=@UTILSCORE,                  
        @RET_SCORE=@SCORE,                   
        @RET_SB=@SB,        
        @RET_SCORINGMETHOD=@SCORINGMETHOD,        
        @RET_ASCORE=@ASCORE;   
                  
END;  



CREATE OR ALTER PROC MPI_GET_RECOMPUTED_AMENDMENTS_DSCR  
(@FAID INT, @TOTALMONTHLYINCOME DECIMAL(20, 2), @TOTALMONTHLYLOANINSTALLMENT_NMI DECIMAL(20, 2),  
  
@RET_DSCRCOMPUTATION DECIMAL(15,2) OUT,  
@RET_TOTALGROSSREVENUE DECIMAL(15,2) OUT,  
@RET_TOTALNMI DECIMAL(15,2) OUT  
)    
AS    
/*=================================================================                       
 Created On: 25-Jan-2024; Created By: ALI ASGAR BAJI;                   
 Modified ON: 19th-Feb-2024; Modified By: Pradyuman Sharma;    
 Details: Calculated DSCR computation on verification (Req From Deep Pandya);     
 EXEC MPI_DSCR_COMPUTATION'1802352',130473, 23016;   
 ===========================================================================*/    
BEGIN    
 DECLARE @GMI INT, @NOB INT;    
 DECLARE @EMPLOYMENTTYPE NVARCHAR(5);    
 DECLARE @DSCR_NONSELFEMP DECIMAL(13, 2);     
 DECLARE @PRIMARY_APP_ID INT    
    
    
  SELECT @PRIMARY_APP_ID=APPLICATIONID FROM APPLICATION A    
  INNER JOIN APL_ex1 A1 ON A.OWNERID=A1.OWNERID AND A.APPLICATIONID=A1.APL_ex1_ID    
  WHERE A.OWNERID=985 and A.RELATEDTOTYPEID=100286 and A.RELATEDTOID=@FAID AND A1.APL_EX1_53='P'    
    
 --SELECT @FAID = RELATEDTOID    
 --FROM APPLICATION(NOLOCK) A    
 --WHERE A.OWNERID = 985    
 -- AND A.ApplicationId = @PRIMARY_APP_ID    
    
     
 IF (    
   EXISTS (    
    SELECT 1    
    FROM VERIFICATION    
    WHERE OWNERID = 985    
     AND LAYOUTID = 10204031    
     AND RELATEDTOID = @PRIMARY_APP_ID    
     AND STATUSCODEID = 100121    
    )    
   )    
 BEGIN    
  SELECT @TOTALMONTHLYLOANINSTALLMENT_NMI = CASE     
    WHEN ISNULL(SUM(APL_EX3_7), 0) = 0 THEN @TOTALMONTHLYLOANINSTALLMENT_NMI    
               ELSE SUM(APL_EX3_7)    
    END    
  FROM APL_EX3 A3    
  INNER JOIN APL_ex1 A1 ON A3.OWNERID = A1.OwnerId    
   AND A3.APL_ex3_ID = A1.Apl_ex1_Id --AND A1.APL_EX1_53!='S'      
  WHERE A3.OWNERID = 985    
   AND A3.APL_EX3_ID IN (    
    SELECT APPLICATIONID    
    FROM APPLICATION A    
    WHERE A.OWNERID = 985    
     AND A.RELATEDTOTYPEID = 100286    
     AND A.RELATEDTOID = @FAID    
    );    
 END    
    
 SET @DSCR_NONSELFEMP = FORMAT((@TOTALMONTHLYINCOME * 0.35) / @TOTALMONTHLYLOANINSTALLMENT_NMI, N'0.00####')    
    
 SELECT VER_EX4_85 AS N'NATUREOFBUSINESS',     
     VER_EX4_86 AS N'NEW EMPLOYMENTTYPE',     
     VER_EX1_60 AS N'GROSSREVENUE',     
     GMI,     
     FORMAT((VER_EX1_60 * (GMI * 0.01) * 0.35) / @TOTALMONTHLYLOANINSTALLMENT_NMI, N'0.00####') AS CALC    
 INTO #TEMP    
 FROM VERIFICATION(NOLOCK) V    
 INNER JOIN VER_EX1(NOLOCK) V1 ON V.OWNERID = V1.OWNERID    
  AND V.CUSTOMOBJECTID = V1.VER_EX1_ID    
 INNER JOIN VER_EX2(NOLOCK) V2 ON V.OWNERID = V2.OWNERID    
  AND V.CUSTOMOBJECTID = V2.VER_EX2_ID    
 INNER JOIN VER_EX4(NOLOCK) V4 ON V.OWNERID = V4.OWNERID    
  AND V.CUSTOMOBJECTID = V4.VER_EX4_ID    
 INNER JOIN MPI_MDM_NATUREOFBUSINESS(NOLOCK) NOB ON V.OWNERID = V4.OWNERID    
  AND V4.VER_EX4_85 = NOB.SIBSCODE    
  AND V4.VER_EX4_86 = EMPLOYMENTCODE     
 WHERE V.OWNERID = 985    
  AND V.LAYOUTID = 10204017    
  AND V.RELATEDTOID = @PRIMARY_APP_ID    
  AND V2.VER_EX2_29 = N'true'    
  AND V4.VER_EX4_86 IN (N'S',N'I');    
    
 SELECT   
 @RET_DSCRCOMPUTATION=ISNULL(SUM(CAST(ISNULL(CALC, 0) AS DECIMAL(13, 2))), 0) + @DSCR_NONSELFEMP,  
 @RET_TOTALGROSSREVENUE=ISNULL(SUM(ISNULL(GROSSREVENUE, 0)), 0),  
 @RET_TOTALNMI=@TOTALMONTHLYLOANINSTALLMENT_NMI   
 FROM #TEMP;    
END; 



    
CREATE OR ALTER  PROCEDURE MPI_GET_RECOMPUTED_AMENDMENTS_GREENLAN        
(        
 @FINANCIALAPPLICATION INT,  
   
 @RET_RESPONSECODE INT OUTPUT,  
 @RET_RESPONSEMESSAGE NVARCHAR(30) OUTPUT,    
 @RET_PDAFINAL NVARCHAR(10) OUTPUT,  
 @RET_FINALSCOREBAND  NVARCHAR(10) OUTPUT,    
 @RET_TOTALAPPLICATIONCOUNT INT OUTPUT,    
 @RET_PRIMARYBORROWERAPPID INT OUTPUT,    
 @RET_MARGINOFFINANCE NVARCHAR(20) OUTPUT  
  
)        
/*-------------------------------------------------  
 CREATED BY : ALI ASGAR BAJI;CREATED ON :27.08.2024;  
 DESC : CREATED FOR RECOMPUTED THE FOLLOWING BASED ON THE CHANGES IN THE AMENDMENTS  
 EXEC MPI_GET_RECOMPUTED_AMENDMENTS_GREENLAN   
--------------------------------------------------*/  
AS        
BEGIN        
 DECLARE @SCOREBANDMETHOD NVARCHAR(10);        
 DECLARE @PDAFINAL NVARCHAR(10),@FINALSCOREBAND NVARCHAR(10),@MARGINOFFINANCE NVARCHAR(20);         
 DECLARE @TOTALAPPLICATIONCOUNT INT;        
 DECLARE @PRIMARYBORROWERAPPID INT;        
        
 SELECT @SCOREBANDMETHOD=CASE WHEN Apl_ex5_88='1' THEN 'BG1'        
   WHEN Apl_ex5_88='2' THEN 'NG2'        
   ELSE 'NA' END FROM Apl_ex5 WHERE OWNERID=985 AND Apl_ex5_id=        
   (SELECT Fia_ex5_129 FROM Fia_ex5 F WHERE OWNERID=985 AND FIA_EX5_ID=@FINANCIALAPPLICATION)        
        
 SELECT   
  @PDAFINAL=Fia_ex5_66,        
  @FINALSCOREBAND=Fia_ex5_83,        
  @MARGINOFFINANCE=Fia_ex5_128         
  FROM Fia_ex5 WHERE OWNERID=985 AND Fia_ex5_Id=@FINANCIALAPPLICATION        
        
 SELECT @TOTALAPPLICATIONCOUNT=COUNT(1) FROM APPLICATION WHERE OWNERID=985 AND RelatedToTypeID=100286 AND RelatedToID=@FINANCIALAPPLICATION        
        
 SELECT @PRIMARYBORROWERAPPID=ApplicationID        
   FROM APPLICATION A        
     INNER JOIN APL_EX1 A1 ON A.OwnerID=A1.OwnerId AND A.ApplicationId=A1.Apl_ex1_Id        
  WHERE A.OWNERID=985 AND RelatedToTypeID=100286 AND RelatedToID=@FINANCIALAPPLICATION AND APL_EX1_53='P';        
        
         
        
 IF(@SCOREBANDMETHOD='NG2')        
 BEGIN        
  -- PDA LEVEL VALIDATION        
  IF(@PDAFINAL='L1' AND @FINALSCOREBAND IN (1,2,3,4))        
  BEGIN        
   -- CRR LEVEL  (ALL BORROWERS)        
   IF((SELECT COUNT(1) FROM Application A         
    INNER JOIN Apl_ex5 A5 ON A.OWNERID=A5.OWNERID AND A.APPLICATIONID=A5.APL_ex5_ID        
     WHERE A.OWNERID=985 AND A.RELATEDTOID=@FINANCIALAPPLICATION AND A5.Apl_ex5_7='L')=@TOTALAPPLICATIONCOUNT)        
    BEGIN        
     IF(@FINALSCOREBAND IN (1,2,3))        
      BEGIN        
       SELECT @RET_RESPONSECODE=1,@RET_RESPONSEMESSAGE='SUCCESS',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE    
      END        
     ELSE        
      BEGIN         
       -- NG2 STP CONDITIONS 2        
       IF(@MARGINOFFINANCE<=0.8 AND         
       (SELECT Apl_ex5_40 FROM Apl_ex5 WHERE OWNERID=985 AND APL_ex5_ID=@PRIMARYBORROWERAPPID)>=35)        
       BEGIN         
             SELECT @RET_RESPONSECODE=1,@RET_RESPONSEMESSAGE='SUCCESS',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE    
       END        
       ELSE        
       BEGIN        
   SELECT @RET_RESPONSECODE=2,@RET_RESPONSEMESSAGE='NG2 STP CONDITIONS 2 FAILED',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE    
       END        
      END        
        
        
    END        
    ELSE        
    BEGIN        
   SELECT @RET_RESPONSECODE=2,@RET_RESPONSEMESSAGE='CRR LEVEL(ALL BORROWERS) FAILED',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
    END        
  END        
  ELSE        
  BEGIN         
            SELECT @RET_RESPONSECODE=2,@RET_RESPONSEMESSAGE='NG2 PDA VALIDATION FAILED',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
  END        
 END         
 ELSE IF(@SCOREBANDMETHOD='BG1')        
 BEGIN        
  DECLARE @TU_MAX_MOB_OFF INT,@TU_G058S INT,@TU_UTIL_OFF DECIMAL(10,2);        
        
  SELECT @TU_MAX_MOB_OFF=Apl_ex5_90,        
    @TU_G058S=Apl_ex5_65,        
    @TU_UTIL_OFF=cast(Apl_ex5_57 as decimal(10,2))/100        
     FROM Apl_ex5 WHERE OWNERID=985 AND Apl_ex5_id=(SELECT Fia_ex5_129 FROM Fia_ex5 F WHERE OWNERID=985 AND FIA_EX5_ID=@FINANCIALAPPLICATION);        
        
        
        
  -- PDA LEVEL VALIDATION BG1        
  IF(@PDAFINAL='L1' AND @FINALSCOREBAND IN (1,2,3,4) AND @TU_MAX_MOB_OFF>=12 AND @TU_G058S=0)        
  BEGIN        
   -- CRR LEVEL  (ALL BORROWERS)        
   IF((SELECT COUNT(1) FROM Application A         
    INNER JOIN Apl_ex5 A5 ON A.OWNERID=A5.OWNERID AND A.APPLICATIONID=A5.APL_ex5_ID        
     WHERE A.OWNERID=985 AND A.RELATEDTOID=@FINANCIALAPPLICATION AND A5.Apl_ex5_7='L')=@TOTALAPPLICATIONCOUNT)        
    BEGIN        
     IF(@FINALSCOREBAND IN (1,2,3))        
      BEGIN        
   SELECT @RET_RESPONSECODE=1,@RET_RESPONSEMESSAGE='SUCCESS',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
  
      END        
     ELSE        
      BEGIN         
       -- NG2 STP CONDITIONS 2        
       IF(@TU_UTIL_OFF<= 0.80)        
       BEGIN         
        SELECT @RET_RESPONSECODE=1,@RET_RESPONSEMESSAGE='SUCCESS',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
       END        
       ELSE        
       BEGIN        
   SELECT @RET_RESPONSECODE=2,@RET_RESPONSEMESSAGE='NG2 STP CONDITIONS 2 FAILED',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
       END        
      END        
        
        
    END        
    ELSE        
    BEGIN       
   SELECT @RET_RESPONSECODE=2,@RET_RESPONSEMESSAGE='CRR LEVEL(ALL BORROWERS) FAILED',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
    END        
  END        
  ELSE        
  BEGIN         
   SELECT @RET_RESPONSECODE=2,@RET_RESPONSEMESSAGE='BG1 PDA VALIDATION FAILED',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
            @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
  END        
        
 END        
 ELSE        
 BEGIN        
   SELECT @RET_RESPONSECODE=2,@RET_RESPONSEMESSAGE='SCOREBAND NOT DEFINED ON APPLICATION',    
            @RET_PDAFINAL=@PDAFINAL,@RET_FINALSCOREBAND=@FINALSCOREBAND,    
            @RET_TOTALAPPLICATIONCOUNT=@TOTALAPPLICATIONCOUNT,    
  @RET_PRIMARYBORROWERAPPID=@PRIMARYBORROWERAPPID,    
            @RET_MARGINOFFINANCE=@MARGINOFFINANCE  
 END        
END        
        