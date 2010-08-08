VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CIconLib"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'/**************************************************************************
'                 ��Ȩ���� (c), 2000 - 2010, ��Ե
'
' ************************   ģ �� ��   :CIconLib********************
'�� �� ��: V1.0
'��    ��: ��Ե
'��������: 2004��03��10��
'����޸�:
'��������:
'�����б�:
'�޸���ʷ:
'��    ��: 2004��03��10��
'�޸���Ա: ��Ե
'�޸�����: ����
'******************************************************************************/
'
Option Explicit
'��ģ������
Private Const THIS_MODULE_NAME As String = "CIconLib"


'�б��Ƿ��Ѿ���ʼ��
Private m_fIsConstructed As Boolean
Private m_sFilename As String
Private m_oIconPackage As CIconPackage

'/**********************************�� �� ��  : IconPackage*********************/
'
'��������:��Դ��
'
'/**************************************************************************/
Public Property Get IconPackage() As CIconPackage
    If Not m_fIsConstructed Then
        'Set IconPackage = Nothing
        Exit Property
    End If
    
    Set IconPackage = m_oIconPackage
End Property



'/**********************************�� �� ��  : IsConstructed*********************/
'
'��������:�б��Ƿ��Ѿ���ʼ��
'
'/**************************************************************************/
Public Property Let IsConstructed(fIsConstructed As Boolean)
    m_fIsConstructed = fIsConstructed
End Property

Public Property Get IsConstructed() As Boolean
     IsConstructed = m_fIsConstructed
End Property


'/**********************************�� �� ��  : Filename*********************/
'
'��������:��Դ�ļ���
'
'/**************************************************************************/
Public Property Let Filename(sFilename As String)
    m_sFilename = sFilename
    m_fIsConstructed = False
End Property

Public Property Get Filename() As String
    Filename = m_sFilename
End Property


'/**********************************�� �� ��  : CreateIconList*********************/
'��������: ������Դ�б�
'
'��    ��:
'
'�� �� ֵ: Boolean
'/**************************************************************************/
Public Function CreateIconList() As Boolean
    On Error GoTo Error_Handler
    
    Set m_oIconPackage = Nothing
    
    Set m_oIconPackage = New CIconPackage
    
    m_oIconPackage.Filename = m_sFilename
    

    m_fIsConstructed = CreateIconListWithObject(m_oIconPackage)
    CreateIconList = m_fIsConstructed
    Exit Function
Error_Handler:
    '�Զ��������
    
    '����Ĭ�ϴ���������
    Call DefaultErrorHandler(THIS_MODULE_NAME)
End Function

Private Sub Class_Terminate()
    Set m_oIconPackage = Nothing
End Sub
