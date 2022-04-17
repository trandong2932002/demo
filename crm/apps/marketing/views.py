from django.shortcuts import render

# Create your views here.
def marketing(request):
    return render(request, 'marketing/marketing.html')