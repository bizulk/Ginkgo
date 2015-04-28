unit ControlADC;

interface
const
//Device type definition
VAI_USBADC	=	1;
VCI_USBCAN1	=	3;
VCI_USBCAN2	=	4;
VGI_USBGPIO	=	1;
VII_USBI2C	=	1;
VSI_USBSPI	=	2;
//�����붨��
ERR_SUCCESS					      =	(0);		// û�д���
ERR_PARAMETER_NULL			  =	(-1);	  // �����ָ��Ϊ��ָ��
ERR_INPUT_DATA_TOO_MUCH		=	(-2);	  // ���������������涨����
ERR_INPUT_DATA_TOO_LESS		=	(-3);	  // ���������������涨����
ERR_INPUT_DATA_ILLEGALITY	=	(-4);	  // ���������ʽ�͹涨�Ĳ�����
ERR_USB_WRITE_DATA			  =	(-5);	  // USBд���ݴ���
ERR_USB_READ_DATA			    =	(-6);	  // USB�����ݴ���
ERR_READ_NO_DATA			    =	(-7);	  // ���������ʱ����û������
ERR_OPEN_DEVICE				    =	(-8);	  // ���豸ʧ��
ERR_CLOSE_DEVICE			    =	(-9);	  // �ر��豸ʧ��
ERR_EXECUTE_CMD				    =	(-10);	// �豸ִ������ʧ��
ERR_SELECT_DEVICE			    =	(-11);	// ѡ���豸ʧ��
ERR_DEVICE_OPENED			    =	(-12);	// �豸�Ѿ���
ERR_DEVICE_NOTOPEN			  =	(-13);	// �豸û�д�
ERR_BUFFER_OVERFLOW			  =	(-14);	// ���������
ERR_DEVICE_NOTEXIST			  =	(-15);	// ���豸������
ERR_LOAD_KERNELDLL			  =	(-16);	// װ�ض�̬��ʧ��
ERR_CMD_FAILED				    =	(-17);	// ִ������ʧ�ܴ�����
ERR_BUFFER_CREATE			    =	(-18);	// �ڴ治��
//����ADCͨ��
VAI_ADC_CH0		= (1 shl 0);	//ADC_CH0
VAI_ADC_CH1		= (1 shl 1);	//ADC_CH1
VAI_ADC_CH2		= (1 shl 2);	//ADC_CH2
VAI_ADC_CH3		= (1 shl 3);	//ADC_CH3
VAI_ADC_CH4		= (1 shl 4);	//ADC_CH4
VAI_ADC_CH5		= (1 shl 5);	//ADC_CH5
VAI_ADC_CH6		= (1 shl 6);	//ADC_CH6
VAI_ADC_CH7		= (1 shl 7);	//ADC_CH7
VAI_ADC_ALL		= ($FF);    	//ADC_CH_ALL

//��������
function VAI_ScanDevice(NeedInit:Byte):Integer; stdcall;
function VAI_OpenDevice(DevType,DevIndex,Reserved:Integer):Integer; stdcall;
function VAI_CloseDevice(DevType,DevIndex:Integer):Integer; stdcall;
function VAI_InitADC(DevType,DevIndex:Integer;Channel:Byte;Period:Word):Integer; stdcall;
function VAI_ReadDatas(DevType,DevIndex:Integer;DataNum:Word;pData:PWord):Integer; stdcall;
implementation

function VAI_ScanDevice;external 'Ginkgo_Driver.dll' name 'VAI_ScanDevice';
function VAI_OpenDevice;external 'Ginkgo_Driver.dll' name 'VAI_OpenDevice';
function VAI_CloseDevice;external 'Ginkgo_Driver.dll' name 'VAI_CloseDevice';
function VAI_InitADC;external 'Ginkgo_Driver.dll' name 'VAI_InitADC';
function VAI_ReadDatas;external 'Ginkgo_Driver.dll' name 'VAI_ReadDatas';
end.